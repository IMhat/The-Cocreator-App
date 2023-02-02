import 'package:flutter/material.dart';

class AnalyticCard extends StatelessWidget {
  const AnalyticCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      height: 220,
      padding: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[850]!.withOpacity(0.29),
              //offset: const Offset(-10, 10),
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/progress.jpg'), fit: BoxFit.contain)),
    );
  }
}
