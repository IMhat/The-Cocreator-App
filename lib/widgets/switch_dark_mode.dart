import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../theme/theme.dart';

class SwitchDarkMode extends StatelessWidget {
  const SwitchDarkMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.lightbulb_outline,
            color: Colors.blue,
          ),
          title: const Text('Dark Mode'),
          trailing: Switch.adaptive(
            value: appTheme.darkTheme,
            onChanged: (value) => appTheme.darkTheme = value,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.phone_android,
            color: Colors.blue,
          ),
          title: const Text('Custom Theme'),
          trailing: Switch.adaptive(
            value: appTheme.customTheme,
            onChanged: (value) => appTheme.customTheme = value,
          ),
        ),
      ],
    );
  }
}
