import 'package:cocreator/pages/screens/hakim/screens/speech_screen.dart';
import 'package:cocreator/pages/screens/profile/widgets/followers.dart';
import 'package:cocreator/pages/screens/profile/widgets/social_profile.dart';
import 'package:cocreator/pages/screens/profile/widgets/user_image_profile.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/widgets/FloatHakeem.dart';
import 'package:cocreator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  //static const String routeName = '/profileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedPage = 0;

  TabController? controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller =
  //       TabController(length: 2, initialIndex: selectedPage, vsync: this);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller!.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    final usuario = authService.usuario;
    final String nombreUsuario = (usuario == null ? "" : usuario.name);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: CustomPaint(
                      painter: _HeaderWaveGradientPainter(),
                      child: AppBar(
                        centerTitle: true,
                        title: SizedBox(
                            width: 180,
                            child: (Image.asset('assets/logo3.png'))),
                        backgroundColor: Colors.transparent,
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
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 170, //size.height * 0.21,
                      left: size.width * 0.40,
                    ),
                    child: Column(
                      children: [
                        const UserImageProfile(),
                        Text(
                          nombreUsuario,
                          style: const TextStyle(fontSize: 20),
                        ),
                        // Text(Preferences.direction,
                        //     style: const TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Followers(),
              const EditProfile(),
              const SizedBox(
                height: 20,
              ),
              const SocialProfile(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 350,
                    // decoration: const BoxDecoration(
                    //     border: Border(
                    //         bottom:
                    //             BorderSide(width: 1, color: Colors.deepPurple))),
                    child: Material(
                      child: TabBar(
                        indicator: BoxDecoration(
                            color: const Color(0xffF1F1FE),
                            borderRadius: BorderRadius.circular(10)),
                        //indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: const Color(0xff143E6C),
                        controller: controller,
                        labelColor: const Color(0xff5151C6),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                width: 110,
                                height: 40,
                                child: const Text(
                                  '200 Shots',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )),
                          ),
                          Tab(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                width: 150,
                                height: 40,
                                child: const Text(
                                  '10 Collections',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: TabBarView(
                      controller: controller,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Image.asset('assets/shot1.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
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

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 160);

    const Gradient gradiente = LinearGradient(
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
        ]);

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 1.50);

    path.quadraticBezierTo(
        size.width * 0.50, size.height * 2.5, size.width, size.height * 1.50);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
