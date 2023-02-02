import 'package:flutter/material.dart';

class Followers extends StatelessWidget {
  const Followers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 241, 241),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '220 followers',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '150 following',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
