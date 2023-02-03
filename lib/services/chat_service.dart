import 'dart:convert';

import 'package:cocreator/global/environment.dart';
import 'package:cocreator/models/mensaje.dart';
import 'package:cocreator/models/mensajes_response.dart';
import 'package:cocreator/models/usuario.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String? usuarioID) async {
    final uri = Uri.parse('${Environment.apiUrl}/mensajes/$usuarioID');
    final resp = await http.post(uri, headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken()
    });
    print(usuarioID);
    print(usuarioPara);
    String? token = await AuthService.getToken();
    print(token);

    final mensajesResp = mensajesResponseFromJson(resp.body);
    return mensajesResp.mensajes;
  }
}
