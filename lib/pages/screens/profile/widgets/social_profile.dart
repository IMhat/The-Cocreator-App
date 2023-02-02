import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialProfile extends StatelessWidget {
  const SocialProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.globe,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.instagram,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chat-screen');
            },
            icon: const Icon(
              FontAwesomeIcons.message,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
