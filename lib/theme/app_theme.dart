import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff143E6C);

  static final ThemeData lightTheme = ThemeData.light().copyWith(

      // Color primario
      primaryColor: const Color(0xff408FCE),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        color: primary, elevation: 0,
        //foregroundColor: primary : este es el color del icono de appbar
      ),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)
          // bodyText2: TextStyle(
          //     color: Colors.black,
          //     fontFamily: 'Sans',
          //     fontSize: 15,
          //     fontWeight: FontWeight.w600),
          ),

      // TextButton Theme
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

      // FloatingActionButtons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),

      // ElevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.indigo, shape: const StadiumBorder(), elevation: 0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primary),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primary),
            borderRadius: BorderRadius.circular(20)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(

      // Color primario
      primaryColor: Colors.indigo,

      // AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}
