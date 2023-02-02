import 'package:flutter/material.dart';

class IaIcon extends StatelessWidget {
  const IaIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 5,
      ),
      child: const CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/image.png'),
      ),
    );
  }
}
