import 'package:cocreator/pages/screens/socialmedia/blog/add_blog_screen.dart';
import 'package:cocreator/pages/screens/socialmedia/home/home_screen_social.dart';
import 'package:cocreator/pages/screens/socialmedia/home/pages/home.dart';
import 'package:cocreator/pages/screens/socialmedia/widgets/picker_channel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:cocreator/pages/screens/cashflow/expense.dart';
import 'package:cocreator/pages/screens/hakim/screens/speech_screen.dart';
import 'package:cocreator/pages/screens/home/home_screen.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:cocreator/widgets/FloatHakeem.dart';
import 'package:cocreator/widgets/FloatHakeem.dart';
import 'package:cocreator/widgets/custom_drawer.dart';

import 'widgets/usercards.dart';

class SocialMediaHome extends StatefulWidget {
  static const String routeName = '/socialmedia';
  const SocialMediaHome({Key? key}) : super(key: key);

  @override
  State<SocialMediaHome> createState() => _SocialMediaHomeState();
}

class _SocialMediaHomeState extends State<SocialMediaHome>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 2, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<PickerItem> channelModes = [
      PickerItem(
        "Startups BOSTON",
      ),
      PickerItem(
        "Crypto - LA",
      ),
      PickerItem(
        "NFT 2023 - LA",
      ),
      PickerItem(
        "Startups BOSTON",
      ),
      PickerItem(
        "Crypto - LA",
      ),
      PickerItem(
        "NFT 2023 - LA",
      ),
    ];

    int counter = 16;
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        //shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SizedBox(width: 120, child: (Image.asset('assets/logo.png'))),
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
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(color: Colors.white),
        // ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(top: 1, bottom: 0, right: 5),
                child: IconButton(
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                      size: 24,
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
      body: Container(
        //height: 700,
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  _title(),
                  const SizedBox(
                    width: 15,
                  ),
                  _textChannel(),
                  Container(
                    height: 50,
                    //width: 50,
                    child: Expanded(
                      child: PickerChannel(pickerItems: channelModes),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _TextUsers(),
                  // const SizedBox(
                  //   width: 25,
                  // ),
                  Container(
                    //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 140,
                    //width: 50,
                    child: Expanded(
                      child: UserCard(),
                    ),
                  ),
                  _textPost(),
                  Container(
                    height: 5000,
                    child: HomeScreenSocial(),
                  ),
                  // SizedBox(
                  //   height: 1000,
                  // )
                ],
              ),
            ),
          ],
        ),

        // body: Container(
        //   height: 700,
        //   color: Colors.white,
        //   child: SingleChildScrollView(
        //     child: SafeArea(
        //         child: Column(children: [
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       _title(),
        //       const SizedBox(
        //         width: 55,
        //       ),
        //       _textChannel(),
        //       Container(
        //         height: 50,
        //         //width: 50,
        //         child: Expanded(
        //           child: PickerChannel(pickerItems: channelModes),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       _TextUsers(),
        //       const SizedBox(
        //         width: 25,
        //       ),
        //       Container(
        //         height: 120,
        //         //width: 50,
        //         child: Expanded(
        //           child: UserCard(),
        //         ),
        //       ),
        //       _textPost(),
        //       Container(
        //         child: Expanded(child: HomeScreenSocial()),
        //       )
        //     ])),
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton.extended(
        //     elevation: 5.0,
        //     onPressed: () {
        //       PersistentNavBarNavigator.pushNewScreen(context,
        //           withNavBar: false,
        //           screen: SpeechScreen(),
        //           pageTransitionAnimation: PageTransitionAnimation.slideUp);
        //     },
        //     label: Text(
        //       'Hakim',
        //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        //     ),
        //     icon: FloatIaIcon()));
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          //Get.to(const AddBlogScreen());
          PersistentNavBarNavigator.pushNewScreen(context,
              withNavBar: false,
              screen: AddBlogScreen(),
              pageTransitionAnimation: PageTransitionAnimation.slideUp);
        },
        child: const Text(
          '+',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        alignment: Alignment.topCenter,
        child: SizedBox(
          child: Text('Community',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ));
  }

  Widget _textChannel() {
    return Container(
      //width: 435,
      //height: 180,
      //margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text('Channel',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 151, 151, 151))),
            const Text('View all',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue)),

            //CardChannel(),
          ],
        ),
      ),
    );
  }

  Widget _TextUsers() {
    return Container(
      //width: 435,
      //height: 180,
      //margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),

      child: Container(
        padding: EdgeInsets.only(top: 22, bottom: 5),
        margin: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text('Users',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 151, 151, 151))),
            const Text('View all',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue)),
          ],
        ),
      ),
    );
    ;
  }

  Widget _textPost() {
    return Container(
      //width: 435,
      //height: 180,
      //margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text('New posts',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 151, 151, 151))),
          ],
        ),
      ),
    );
    ;
  }
}
