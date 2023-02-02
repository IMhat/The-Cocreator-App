import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final dynamic decoration;

  const ButtonGradient({
    Key? key,
    required this.text,
    required this.onTap,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 350,
        height: 60,
        decoration: decoration,
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Sans',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
