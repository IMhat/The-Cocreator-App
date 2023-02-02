import 'package:cocreator/pages/bottom_bar.dart';
import 'package:cocreator/pages/screens/questions/lenguaje.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void check() async {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
}

class Check extends StatefulWidget {
  static const String routeName = '/check-screen';
  const Check({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: isviewed != 0 ? OnBoard() : const BottomBar(),
    //   );
    // }

    //crear una screen para las otras pantallas( ejemplo selector de idioma)

    //para trabajar en las preguntas, poner isViewed != 1, pq esta programado para que si ya respondiste las preguntas, no te las vuelva a mostar! (con isViewed != 0)

    return Scaffold(
        body: Container(
      child: isviewed != 1 ? LenguajeScreen() : const BottomBar(),
    ));
    // return Scaffold(
    //   body: isviewed != 0 ? OnBoard() : const BottomBar(),
    // );
  }
}
