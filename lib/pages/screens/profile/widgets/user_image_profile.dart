import 'package:flutter/material.dart';

class UserImageProfile extends StatelessWidget {
  const UserImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black, width: 3)),
      margin: const EdgeInsets.only(right: 5),
      child: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assets/userprofile.jpg'),
      ),
    );
  }
}
