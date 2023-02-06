import 'package:cocreator/pages/screens/hakim/screens/speech_screen.dart';
import 'package:cocreator/pages/screens/home/services/quickbooks/quickbooks.dart';
import 'package:cocreator/pages/screens/questions/widgets/accounts.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/widgets/FloatHakeem.dart';
import 'package:cocreator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 16;

  Widget _ConnectButton() {
    return InkWell(
        onTap: () {
          PersistentNavBarNavigator.pushNewScreen(context,
              screen: QuickbooksScreen());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //       color: Colors.grey.shade200,
              //       offset: Offset(2, 4),
              //       blurRadius: 5,
              //       spreadRadius: 2)
              // ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 78, 78, 78),
                    Color.fromARGB(255, 0, 0, 0)
                  ])),
          child: Text(
            'Connect accounts',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget recentTransaction() {
    return Container(
        width: 335,
        height: 180,
        //margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Recent transaction',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 27, 27, 27))),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Text('There are not transactions yet.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 63, 63, 63)))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: 40),
                    //alignment: Alignment.center,
                    child: Icon(
                      Icons.currency_exchange_sharp,
                      size: 70,
                      color: Colors.grey,
                    ),
                  )),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _AccountsConnect() {
    return Container(
        width: 335,
        height: 450,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: Text('My balance',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 27, 27, 27))),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                  'connect your accounts to see the evolution of your business',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 63, 63, 63))),
            ),
            const SizedBox(
              child: Accounts(),
            ),
            const SizedBox(
              height: 10,
            ),
            _ConnectButton(),
            const SizedBox(
              width: 25,
            )

            // ElevatedButton(
            //   child: const Text("Quickbooks-conect"),
            //   onPressed: () => PersistentNavBarNavigator.pushNewScreen(context,
            //       screen: QuickbooksScreen()),
            // ),
            // // SizedBox(
            // //   width: 10,
            // // ),
            // ElevatedButton(
            //   child: const Text("Freshbooks-conect"),
            //   onPressed: () => PersistentNavBarNavigator.pushNewScreen(context,
            //       screen: QuickbooksScreen()),
            // ),
            // // SizedBox(
            // //   width: 10,
            // // ),
            // ElevatedButton(
            //   child: const Text("Xero-conect"),
            //   onPressed: () => PersistentNavBarNavigator.pushNewScreen(context,
            //       screen: QuickbooksScreen()),
            // ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    //final user = context.watch<UserProvider>().user;

    final authService = Provider.of<AuthServices>(context);

    final usuario = authService.usuario;
    final String nombreUsuario = (usuario == null ? "" : usuario.name);

    return Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.black,
          child: CustomDrawer(),
        ),

        // appBar: AppBar(actions: [
        //   TextButton.icon(
        //     icon: const Icon(
        //       Icons.add,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // Navigator.pushNamed(
        //       //   context,
        //       //   '/crear-empresas',
        //       // );
        //       context.go('/crear-empresas');
        //     },
        //     label: const Text(
        //       'Create Company',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   )
        // ], title: Text('Hi User')

        //     //actions: const [IaIcon()],
        //     ),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(width: 180, child: (Image.asset('assets/logo3.png'))),
          // title: Row(
          //   children: [
          //     SizedBox(
          //       width: 80,
          //     ),
          //     SizedBox(
          //       child: Container(
          //         child: Text(
          //           "Cocreator",
          //           style: TextStyle(
          //               fontSize: 30,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.black),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 100,
          //     ),
          //     SizedBox(
          //       child: Container(
          //         alignment: Alignment.centerLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Icon(
          //             Icons.notifications,
          //             color: Colors.black,
          //             size: 30,
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    //     stops: [
                    //   0.2,
                    //   0.4,
                    // ],
                    colors: [
                  Color.fromARGB(255, 143, 200, 241),
                  // Color.fromARGB(255, 94, 129, 253),
                  Color.fromARGB(255, 70, 106, 234)
                ])),
          ),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 1, bottom: 0, right: 5),
                  child: IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          counter = 1;
                        });
                      }),
                ),
                counter != 0
                    ? Positioned(
                        right: 11,
                        top: 11,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$counter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ],
        ),
        //           floatingActionButton: FloatingActionButton(onPressed: () {
        //       print("Increment Counter");
        //       setState(() {
        //         counter++;
        //       });
        //     }, child: Icon(Icons.add),),
        //   );
        // }

        // alignm,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    //     stops: [
                    //   0.2,
                    //   0.4,
                    // ],
                    colors: [
                  Color.fromARGB(255, 143, 200, 241),
                  // Color.fromARGB(255, 94, 129, 253),
                  Color.fromARGB(255, 70, 106, 234)
                ])),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                //TotalBalance(),
                // SizedBox(
                //   child: ElevatedButton(
                //     child: const Text("Quickbooks-conect"),
                //     onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                //         context,
                //         screen: QuickbooksScreen()),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        // 'Hi Guest',
                        'Hello ',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        '${nombreUsuario} !',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.waving_hand,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                _AccountsConnect(),
                SizedBox(
                  height: 5,
                ),
                recentTransaction(),
                //_HakimButton(),
                const SizedBox(
                  height: 300,
                ),

                // AnalyticCard(),
                // FooterHome(),
                // Container(
                //     width: 250,
                //     height: 50,
                //     alignment: Alignment.bottomRight,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //     ),
                //     child: SizedBox(
                //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       child: FloatingActionButton(
                //         backgroundColor: Color.fromARGB(255, 155, 155, 155),
                //         child: const Icon(FontAwesomeIcons.circle),
                //         onPressed: () {
                //           Navigator.pushNamed(context, SpeechScreen.routeName);
                //         },
                //       ),
                //     ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            elevation: 5.0,
            onPressed: () {
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
}
