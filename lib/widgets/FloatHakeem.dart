import 'package:flutter/material.dart';

class FloatIaIcon extends StatelessWidget {
  const FloatIaIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 5,
      ),
      child: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/image.png'),
      ),
    );
  }
}
