import 'package:cocreator/helpers/mostrar_alerta.dart';
import 'package:cocreator/helpers/navegar_pagina.dart';
import 'package:cocreator/pages/bottom_bar.dart';
import 'package:cocreator/pages/check_onboarding.dart';
import 'package:cocreator/pages/register_page.dart';
import 'package:cocreator/pages/usuarios_page.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:cocreator/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:cocreator/widgets/custom_input.dart';
import 'package:cocreator/widgets/labels.dart';
import 'package:cocreator/widgets/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  Widget _title() {
    return Container(
        height: 120,
        width: 550,
        child: IconButton(
          icon: Image.asset('assets/logo.png'),
          //iconSize: 600,
          onPressed: () {},
        ));
  }

  Widget _dividerTittle() {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 80,
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
          SizedBox(
            width: 80,
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
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
                  //   titulo: 'Cocreator',
                  // ),
                  //SizedBox(height: 5),
                  _title(),
                  _dividerTittle(),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text('Log in',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 151, 151, 151))),
                  ),

                  _Form(),

                  Labels(
                      ruta: RegisterPage(),
                      titulo: '¿You do not have an account?',
                      subtitulo: 'Sign in!'),
                  _divider(),
                  _SocialButton(),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: Text(
                    'Terms and conditions of use',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ))
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

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Email',
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 151, 151, 151),
                fontSize: 20,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInput(
          icon: Icons.mail_outline,
          placeholder: 'Enter email',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Password',
            style: GoogleFonts.poppins(
              color: Color.fromARGB(255, 151, 151, 151),
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          placeholder: 'Enter password',
          textController: passCtrl,
          isPassword: true,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(bottom: 0),
          alignment: Alignment.centerRight,
          child: Text('Recovery Password',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue)),
        ),
        BotonAzul(
            text: 'Log in',
            onPressed: authService.autenticando
                ? null
                : () async {
                    print(emailCtrl.text);
                    print(passCtrl.text);
                    FocusScope.of(context).unfocus();
                    final loginOk = await authService.login(
                        emailCtrl.text.trim(), passCtrl.text.trim());
                    if (loginOk) {
                      // Empezamos los sockets
                      socketService.connect();
                      // navegarPagina(context, UsuariosPage());
                      navegarPagina(context, Check());
                    } else {
                      mostrarAlerta(context, 'Login Incorrecto',
                          'Revisa tus credenciales nuevamente');
                    }
                  })
      ]),
    );
  }
}
