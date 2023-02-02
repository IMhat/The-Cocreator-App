import 'package:cocreator/helpers/mostrar_alerta.dart';
import 'package:cocreator/helpers/navegar_pagina.dart';
import 'package:cocreator/pages/check_onboarding.dart';
import 'package:cocreator/pages/login_page.dart';
import 'package:cocreator/pages/usuarios_page.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:cocreator/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:cocreator/widgets/custom_input.dart';
import 'package:cocreator/widgets/labels.dart';
import 'package:cocreator/widgets/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  Widget _title() {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(vertical: 0),
      alignment: Alignment.centerLeft,
      child: Image.asset('assets/logo.png'),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          Text('OR',
              style: TextStyle(
                  color: Color.fromARGB(255, 151, 151, 151),
                  fontSize: 25,
                  fontWeight: FontWeight.w500)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _SocialButton() {
    return Container(
        width: 250,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Color(0xff3b5998),
              child: const Icon(FontAwesomeIcons.facebook),
              onPressed: () {},
            ),
            // SizedBox(
            //   width: 10,
            // ),
            FloatingActionButton(
              backgroundColor: Color(0xff4288f4),
              child: const Icon(FontAwesomeIcons.google),
              onPressed: () {},
            ),
            // SizedBox(
            //   width: 10,
            // ),
            FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 0, 114, 180),
              child: const Icon(FontAwesomeIcons.linkedin),
              onPressed: () {},
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height * 1.1,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo(
                  //   titulo: 'Register',
                  // ),
                  //SizedBox(height: 10),
                  _title(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    alignment: Alignment.centerLeft,
                    child: Text('Create your account',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 151, 151, 151))),
                  ),
                  _Form(),
                  Labels(
                      ruta: LoginPage(),
                      titulo: 'I have one',
                      subtitulo: 'Back to login'),
                  _divider(),
                  _SocialButton()
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  Widget _termsOfService() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'By signing up you agree to our ',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Color.fromARGB(255, 0, 0, 0)),
          children: [
            TextSpan(
              text: 'Terms of Service ',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
            TextSpan(
              text: 'and ',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
            TextSpan(
              text: ', and confirm that you are at least 18 years old.',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    bool verificarCamposNoNulos() {
      bool camposLlenos = false;
      if (emailCtrl.text.toString() != '' &&
          passCtrl.text.toString() != '' &&
          nameCtrl.text.toString() != '') {
        camposLlenos = true;
      }
      return camposLlenos;
    }

    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Name',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color.fromARGB(255, 151, 151, 151)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Name',
            textController: nameCtrl),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Email',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color.fromARGB(255, 151, 151, 151)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomInput(
          icon: Icons.mail_outline,
          placeholder: 'Email',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Password',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color.fromARGB(255, 151, 151, 151)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          placeholder: 'Password',
          textController: passCtrl,
          isPassword: true,
        ),
        _termsOfService(),
        BotonAzul(
            text: 'Sign up',
            onPressed: authService.autenticando && verificarCamposNoNulos()
                ? null
                : () async {
                    print(nameCtrl.text);
                    print(emailCtrl.text);
                    print(passCtrl.text);
                    final registroOk = await authService.register(
                        nameCtrl.text.trim(),
                        emailCtrl.text.trim(),
                        passCtrl.text.trim());
                    if (registroOk == true) {
                      // Conectamos el servidor de sockets
                      socketService.connect();
                      navegarPagina(context, Check());
                    } else {
                      mostrarAlerta(
                          context, 'Wrong registration', registroOk.toString());
                    }
                  })
      ]),
    );
  }
}
