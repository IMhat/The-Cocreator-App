import 'dart:ui';

import 'package:cocreator/pages/screens/cashflow/expense.dart';
import 'package:cocreator/pages/screens/hakim/screens/speech_screen.dart';
import 'package:cocreator/widgets/FloatHakeem.dart';
import 'package:cocreator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'socialhome.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialScreen extends StatefulWidget {
  static const String routeName = '/socialmedia';
  const SocialScreen({Key? key}) : super(key: key);

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen>
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
    final currentWidth = MediaQuery.of(context).size.width;
    int counter = 16;
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
                    icon: const Icon(
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
                        padding: const EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: const TextStyle(
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 03,
              ),
              _TextBody(),
              const SizedBox(
                height: 02,
              ),
              _ImageBody(),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
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
      //     icon: FloatIaIcon())
    );
  }

  Widget _TextBody() {
    return Container(
        width: 335,
        //height: 93,
        //margin: EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.only(left: 40),
              //margin: EdgeInsets.only(top: 50),
              //alignment: Alignment.center,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Welcome',
                        style: TextStyle(
                            fontFamily: '.SF UI Text',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 50, 174, 245))),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('to the Community',
                        style: TextStyle(
                            fontFamily: '.SF UI Text',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 50, 174, 245))),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _ImageBody() {
    return Container(
        width: 335,
        //height: 350,
        //margin: EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.symmetric(vertical: 10),
              //margin: EdgeInsets.symmetric(horizontal: 60),
              alignment: Alignment.center,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    width: 306,
                    height: 306,
                    child: IconButton(
                      icon: Image.asset('assets/socialimage.png'),
                      iconSize: 700,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: Image.asset('assets/image_comunidad.png')),
                  const SizedBox(
                    height: 50,
                  ),
                  _StartButton(),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _StartButton() {
    return InkWell(
        onTap: () {
          PersistentNavBarNavigator.pushNewScreen(context,
              screen: const SocialMediaHome());
        },
        child: Container(
          //width: 300,
          padding: const EdgeInsets.symmetric(vertical: 15),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
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
            'Start',
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors
                    .white) /*TextStyle(fontSize: 20, color: Colors.white)*/,
          ),
        ));
  }
}
