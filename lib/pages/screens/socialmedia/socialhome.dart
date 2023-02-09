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
import 'widgets/card_channel.dart';
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
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Community',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 30, color: Color.fromRGBO(255, 255, 255, 1))),

          //SizedBox(width: 180, child: (Image.asset('assets/logo3.png'))),
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
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            _TextChannel(),
            const SizedBox(
              width: 25,
            ),
            const SizedBox(
              height: 20,
            ),
            _TextUsers(),
            const SizedBox(
              width: 25,
            )
          ])),
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

  Widget _TextChannel() {
    return Container(
        width: 435,
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
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topCenter,

              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Channel',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(223, 220, 218, 218))),
                  Container(
                      padding: const EdgeInsets.only(left: 50.0),
                      //EdgeInsets.only(bottom: 10),

                      child: TextButton(
                          onPressed: (() {}), child: const Text('View All'))),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardChannel(),
                  SizedBox(
                    width: 90,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _TextUsers() {
    return Container(
        width: 435,
        height: 250,
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
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topCenter,

              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Users',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(223, 220, 218, 218))),
                  Container(
                      padding: const EdgeInsets.only(left: 50.0),
                      //EdgeInsets.only(bottom: 10),

                      child: TextButton(
                          onPressed: (() {}), child: const Text('View All'))),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UserCard(),
                  SizedBox(
                    width: 90,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
