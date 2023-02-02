import 'package:cocreator/theme/app_theme.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../cashflow/widgets/white_inputfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  void displayDialogIOS(BuildContext context) {
    final GlobalKey<FormState> businessFormKey = GlobalKey<FormState>();

    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: SingleChildScrollView(
              child: Form(
                key: businessFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WhiteInputField(
                      initialValue: 'guest',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.person,
                      labelText: 'Name Business',
                      hintText: 'Name Business',
                      formProperty: 'name business',
                      keyboardType: TextInputType.text,
                      // formValues: formValues
                    ),
                    const SizedBox(height: 10),
                    WhiteInputField(
                      initialValue: 'email',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.email,
                      labelText: 'Email',
                      hintText: 'Email',
                      formProperty: 'email',
                      keyboardType: TextInputType.emailAddress,
                      //formValues: formValues
                    ),
                    const SizedBox(height: 10),
                    WhiteInputField(
                      initialValue: 'numberphone',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.phone,
                      labelText: 'Number Phone',
                      hintText: 'Number Phone',
                      formProperty: 'phone',
                      keyboardType: TextInputType.number,
                      // formValues: formValues
                    ),
                    const SizedBox(height: 10),
                    WhiteInputField(
                      initialValue: 'direction',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.location_city,
                      labelText: 'Direction',
                      hintText: 'Direction',
                      formProperty: 'direction',
                      keyboardType: TextInputType.streetAddress,
                      // formValues: formValues
                    ),
                    const SizedBox(height: 10),
                    WhiteInputField(
                      initialValue: 'siteweb',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.link,
                      labelText: 'Site Web',
                      hintText: 'Site Web',
                      formProperty: 'site web',
                      keyboardType: TextInputType.url,
                      //formValues: formValues
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar',
                      style: TextStyle(color: Colors.red))),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok')),
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    final GlobalKey<FormState> businessFormKey = GlobalKey<FormState>();

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: const Text('Titulo'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            content: SingleChildScrollView(
              child: Form(
                key: businessFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WhiteInputField(
                      initialValue: 'guest',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.person,
                      labelText: 'Name Business',
                      hintText: 'Name Business',
                      formProperty: 'name business',
                      keyboardType: TextInputType.text,
                      // formValues: formValues
                    ),
                    const SizedBox(height: 10),
                    WhiteInputField(
                      initialValue: 'email',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.email,
                      labelText: 'Email',
                      hintText: 'Email',
                      formProperty: 'email',
                      keyboardType: TextInputType.emailAddress,
                      // formValues: formValues
                    ),
                    const SizedBox(height: 10),
                    WhiteInputField(
                      initialValue: 'numberphone',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.phone,
                      labelText: 'Number Phone',
                      hintText: 'Number Phone',
                      formProperty: 'phone',
                      keyboardType: TextInputType.number,
                      //  formValues: formValues
                    ),
                    const SizedBox(height: 10),
                    WhiteInputField(
                      initialValue: 'direction',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.location_city,
                      labelText: 'Direction',
                      hintText: 'Direction',
                      formProperty: 'direction',
                      keyboardType: TextInputType.streetAddress,
                      //formValues: formValues
                    ),
                    const SizedBox(height: 10),
                    WhiteInputField(
                      initialValue: 'siteweb',
                      onChanged: (value) {
                        value = value;
                        setState(() {});
                      },
                      icon: Icons.link,
                      labelText: 'Site Web',
                      hintText: 'Site Web',
                      formProperty: 'site web',
                      keyboardType: TextInputType.url,
                      // formValues: formValues
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: const Icon(
          Icons.edit,
          color: AppTheme.primary,
        ),
        label: const Text(
          'Edit Profile',
          style: TextStyle(color: AppTheme.primary),
        ),
        //  onPressed: () => displayDialogAndroid( context )
        onPressed: () => Platform.isAndroid
            ? displayDialogAndroid(context)
            : displayDialogIOS(context));
  }
}
