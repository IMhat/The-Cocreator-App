import 'package:another_quickbooks/another_quickbooks.dart';
import 'package:another_quickbooks/quickbook_models.dart';
import 'package:cocreator/helpers/widgets/loader.dart';
import 'package:cocreator/pages/screens/hakim/screens/speech_screen.dart';
import 'package:cocreator/pages/screens/home/home_screen.dart';
import 'package:cocreator/widgets/FloatHakeem.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class QuickbooksScreen extends StatefulWidget {
  static const String routeName = '/home';
  const QuickbooksScreen({Key? key}) : super(key: key);

  @override
  State<QuickbooksScreen> createState() => _QuickbooksScreenState();
}

class _QuickbooksScreenState extends State<QuickbooksScreen> {
  late final WebViewController controller;

  final String applicationId = "7a0a57b2-a22a-4da2-90c4-b6415bf865c0";

  final String clientId = "ABaRfByg1zPZbvQfMAcQtPE7guilPx3RkGX3AVIQLTX2jV9FBM";
  final String clientSecret = "i2KnSMAynvMeI10xM1NcCgucCIu0QWXmQg9rjUjP";

  final String refreshToken =
      "AB11683235306RkGfMaV4EuahU5WQ6GlwqlbbvANmXW6Gz5AfB"; //"AB11652210098Wbv587q2tebOcKFcsPRplbRtoqobsvEmI2vVr";

  String? realmId;

  // Configured in Quickbooks Dashboard.

  final String redirectUrl =
      "https://developer.intuit.com/v2/OAuth2Playground/RedirectUrl";

  QuickbooksClient? quickClient;
  String authUrl = "";
  TokenResponse? token;

  // temporary list
  // List<CashFlow>? cash;

  // final QuickbookService quickbookServices = QuickbookService();

  // void fetchWallet() async {
  //   cash = await quickbookServices.fetchCashFlow(context: context);
  //   setState(() {});
  // }

  void initState() {
    print("Init Called");
    initializeQuickbooks();

    //fetchWallet();
  }

  ///
  /// Initialize Quickbooks Client
  ///
  Future<void> initializeQuickbooks() async {
    quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret,
        environmentType: EnvironmentType.Sandbox);

    await quickClient!.initialize();
    setState(() {
      authUrl = quickClient!.getAuthorizationPageUrl(
          scopes: [Scope.Payments, Scope.Accounting],
          redirectUrl: redirectUrl,
          state: "state123");
    });
  }

  Future<void> requestAccessToken(String code, String realmId) async {
    this.realmId = realmId;
    token = await quickClient!
        .getAuthToken(code: code, redirectUrl: redirectUrl, realmId: realmId);

    setState(() {});
  }

  Widget _webViewLoader() {
    var loadingPercentage = 0;

    return Stack(children: [
      WebViewWidget(
          controller: controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  print('WebView is loading (progress : $progress%)');
                  print(authUrl);
                  //const Loader();
                },
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                  //const Loader();
                  loadingPercentage = 0;
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');

                  //const Loader();
                  loadingPercentage = 100;
                },
                onWebResourceError: (WebResourceError error) {
                  //Loader();
                },
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith(redirectUrl)) {
                    print('blocking navigation to $request}');
                    var url = Uri.parse(request.url);
                    String code = url.queryParameters["code"]!;
                    String realmId = url.queryParameters['realmId']!;
                    // Request access token
                    requestAccessToken(code, realmId);

                    return NavigationDecision.prevent;
                  }
                  print('allowing navigation to $request');
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(authUrl))),
      if (loadingPercentage < 100)
        LinearProgressIndicator(
          value: loadingPercentage / 100.0,
          color: Colors.blue,
        ),
      //Loader()
    ]);
  }

  Widget _webView() {
    return Container(child: authUrl == '' ? Loader() : _webViewLoader());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Container(
          child: token == null
              // ? WebViewWidget(controller: controller)
              ? _webView()
              : Container(
                  child: Stack(children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            const SizedBox(height: 100),
                            const SizedBox(
                              child: Text(
                                'Authenticated with quickbooks',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 27, 27, 27)),
                              ),
                            ),
                            const SizedBox(
                              child: Text(
                                'Token de acceso, del usuario para consultar info a quickbooks',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 27, 27, 27)),
                              ),
                            ),
                            const SizedBox(height: 100),
                            SizedBox(child: Text(token.toString())),
                            const SizedBox(height: 10),
                            SizedBox(
                              child: ElevatedButton(
                                child: const Text("Desconect"),
                                onPressed: () =>
                                    PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: HomeScreen()),
                              ),
                            ),
                          ]))),
                ])),
        ),
        floatingActionButton: FloatingActionButton.extended(
            elevation: 5.0,
            onPressed: () {
              print(token);
              PersistentNavBarNavigator.pushNewScreen(context,
                  withNavBar: false,
                  screen: SpeechScreen(),
                  pageTransitionAnimation: PageTransitionAnimation.slideUp);
            },
            label: Text(
              'Hakim',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            icon: FloatIaIcon()));
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       // appBar: AppBar(
  //       //   title: Text(widget.title),
  //       // ),
  //       body: Container(
  //         child: token == null
  //             // ? WebViewWidget(controller: controller)
  //             ? WebViewWidget(
  //                 controller: controller = WebViewController()
  //                   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //                   ..setBackgroundColor(const Color(0x00000000))
  //                   ..setNavigationDelegate(
  //                     NavigationDelegate(
  //                       onProgress: (int progress) {
  //                         print('WebView is loading (progress : $progress%)');
  //                         print(authUrl);
  //                         const Loader();
  //                       },
  //                       onPageStarted: (String url) {
  //                         print('Page started loading: $url');
  //                         const Loader();
  //                       },
  //                       onPageFinished: (String url) {
  //                         print('Page finished loading: $url');
  //                         const Loader();
  //                       },
  //                       onWebResourceError: (WebResourceError error) {
  //                         Loader();
  //                       },
  //                       onNavigationRequest: (NavigationRequest request) {
  //                         if (request.url.startsWith(redirectUrl)) {
  //                           print('blocking navigation to $request}');
  //                           var url = Uri.parse(request.url);
  //                           String code = url.queryParameters["code"]!;
  //                           String realmId = url.queryParameters['realmId']!;
  //                           // Request access token
  //                           requestAccessToken(code, realmId);

  //                           return NavigationDecision.prevent;
  //                         }
  //                         print('allowing navigation to $request');
  //                         return NavigationDecision.navigate;
  //                       },
  //                     ),
  //                   )
  //                   ..loadRequest(Uri.parse(authUrl)))
  //             : Container(
  //                 child: Stack(children: <Widget>[
  //                 Container(
  //                     padding: EdgeInsets.symmetric(horizontal: 20),
  //                     child: SingleChildScrollView(
  //                         child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: <Widget>[
  //                           const SizedBox(height: 100),
  //                           const SizedBox(
  //                             child: Text(
  //                               'Authenticated with quickbooks',
  //                               style: TextStyle(
  //                                   fontSize: 35,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: Color.fromARGB(255, 27, 27, 27)),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             child: Text(
  //                               'Token de acceso, del usuario para consultar info a quickbooks',
  //                               style: TextStyle(
  //                                   fontSize: 15,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: Color.fromARGB(255, 27, 27, 27)),
  //                             ),
  //                           ),
  //                           const SizedBox(height: 100),
  //                           SizedBox(child: Text(token.toString())),
  //                           const SizedBox(height: 10),
  //                           SizedBox(
  //                             child: ElevatedButton(
  //                               child: const Text("Desconect"),
  //                               onPressed: () =>
  //                                   PersistentNavBarNavigator.pushNewScreen(
  //                                       context,
  //                                       screen: HomeScreen()),
  //                             ),
  //                           ),
  //                         ]))),
  //               ])),
  //       ),
  //       floatingActionButton: FloatingActionButton.extended(
  //           elevation: 5.0,
  //           onPressed: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => SpeechScreen(),
  //                 ));
  //           },
  //           label: Text(
  //             'Hakim',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
  //           ),
  //           icon: FloatIaIcon()));
  // }
}
