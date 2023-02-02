import 'package:cocreator/helpers/navegar_pagina.dart';
import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final Widget ruta;

  const Labels(
      {Key? key,
      required this.titulo,
      required this.subtitulo,
      required this.ruta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Text(this.titulo,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w300)),
      SizedBox(height: 10),
      GestureDetector(
        child: Text(this.subtitulo,
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        onTap: () {
          navegarPagina(context, this.ruta);
          // navegarPagina(context, this.ruta);
        },
      )
    ]));
  }
}
