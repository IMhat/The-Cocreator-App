import 'package:cocreator/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonSmall extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ButtonSmall({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: 100,
        height: 30,
        decoration: BoxDecoration(
            color: AppTheme.primary, borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Sans',
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
