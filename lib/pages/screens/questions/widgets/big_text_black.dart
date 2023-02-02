import 'package:flutter/material.dart';

class BigTextBlack extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigTextBlack(
      {Key? key,
      this.color,
      required this.text,
      required this.size,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontWeight: FontWeight.w900,
          fontSize: size),
    );
  }
}
