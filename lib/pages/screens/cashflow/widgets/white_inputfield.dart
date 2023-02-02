import 'package:cocreator/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WhiteInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final dynamic onChanged;
  final dynamic initialValue;
  final String formProperty;
//  final Map<String, String> formValues;

  const WhiteInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    // required this.formValues,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        initialValue: initialValue,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        style: const TextStyle(color: AppTheme.primary),
        validator: (value) {
          if (value == null) return 'Este campo es requerido';
          return value.length < 3 ? 'Mínimo de 3 letras' : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
