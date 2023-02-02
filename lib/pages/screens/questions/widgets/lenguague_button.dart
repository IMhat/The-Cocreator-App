import 'dart:ffi';

import 'package:flutter/material.dart';

class LenguagueButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Image imagen;

  const LenguagueButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.imagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(6.0),
        width: 400,
        height: 75,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: const Color.fromARGB(255, 163, 163, 163))),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              imagen,
              const SizedBox(
                width: 80,
              ),
              Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontFamily: 'Sans',
                      color: Color.fromARGB(255, 148, 148, 148),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          // child: Text(
          //   text,
          //   style: const TextStyle(
          //       fontFamily: 'Sans',
          //       color: Color.fromARGB(255, 148, 148, 148),
          //       fontSize: 30,
          //       fontWeight: FontWeight.bold),
          //   textAlign: TextAlign.center,
          // ),
        ));
  }
}
