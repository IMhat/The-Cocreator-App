import 'package:cocreator/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../global/environment.dart';

import '../models/mensajes_response.dart';
import '../models/usuarios.dart';

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;

  Future<List<Mensaje>> getchat(String usuarioId) async {
    final res = await http.get(
        Uri.parse('${Environment.apiUrl}/mensajes/${usuarioId}'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthServices.getToken()
        });

    final mensajesResponse = mensajesResponseFromJson(res.body);

    return mensajesResponse.mensajes;
  }
}
