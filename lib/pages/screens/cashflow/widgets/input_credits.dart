import 'package:cocreator/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputsCredits extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;

  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  // final String formProperty;
  //final Map<String, String> formValues;

  const InputsCredits({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    //required this.formProperty,
    //required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(color: AppTheme.primary),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppTheme.primary),
          labelText: labelText,
          labelStyle: const TextStyle(color: AppTheme.primary),
          helperText: helperText,
          helperStyle: const TextStyle(color: AppTheme.primary),
          // prefixIcon: Icon( Icons.verified_user_outlined ),
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon),
        ));
  }
}
