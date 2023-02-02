import 'package:flutter/material.dart';

navegarPagina(BuildContext context, Widget pagina) {
  return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => pagina,
          transitionDuration: Duration(milliseconds: 0)));
}
