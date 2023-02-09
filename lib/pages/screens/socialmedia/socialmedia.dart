import 'package:cocreator/pages/screens/cashflow/expense.dart';
import 'package:cocreator/pages/screens/hakim/screens/speech_screen.dart';
import 'package:cocreator/widgets/FloatHakeem.dart';
import 'package:cocreator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'socialhome.dart';

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
    return Scaffold(
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(width: 180, child: (Image.asset('assets/logo3.png'))),
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
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                _TextBody(),
                const SizedBox(
                  width: 25,
                ),
                const SizedBox(
                  height: 10,
                ),
                _ImageBody(),
                const SizedBox(
                  width: 10,
                ),
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

  Widget _TextBody() {
    return Container(
        width: 335,
        height: 93,
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
              margin: EdgeInsets.symmetric(horizontal: 60),
              alignment: Alignment.center,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Welcome to the Community',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 50, 174, 245))),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 15,
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
        height: 700,
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
              margin: EdgeInsets.symmetric(horizontal: 60),
              alignment: Alignment.center,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    width: 300,
                    height: 500,
                    child: IconButton(
                      icon: Image.asset('assets/socialimage.png'),
                      iconSize: 500,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/image_comunidad.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  _StartButton(),
                  const SizedBox(
                    width: 25,
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
              screen: SocialMediaHome());
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
            'Start',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }
}
