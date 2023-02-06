import 'package:cocreator/helpers/navegar_pagina.dart';
import 'package:cocreator/pages/check_onboarding.dart';
import 'package:cocreator/pages/usuarios_page.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: checkLoginState(context),
          builder: (context, snapshot) {
            return Center(
              child: Text('Wait...'),
            );
          }),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthServices>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    // if (autenticado) {
    //   // conectar al socket server
    //   socketService.connect();
    //   // Navigator.pushReplacementNamed(context, 'usuarios');
    //   navegarPagina(context, UsuariosPage());
    // } else {
    //   navegarPagina(context, LoginPage());
    // }
    if (autenticado) {
      // conectar al socket server
      socketService.connect();
      // Navigator.pushReplacementNamed(context, 'usuarios');
      navegarPagina(context, const Check());
    } else {
      navegarPagina(context, LoginPage());
    }
  }
}
