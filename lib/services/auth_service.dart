import 'dart:convert';

import 'package:cocreator/global/environment.dart';
import 'package:cocreator/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/usuarios.dart';

class AuthServices with ChangeNotifier {
  late Usuario usuario;
  bool _autenticando = false;
  final _storage = FlutterSecureStorage();
  bool get autenticando => _autenticando;
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  //Getter toke staticos
  static Future<String> getToken() async {
    final _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token!;
  }

  static Future<void> deleteToken() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;

    final data = {'email': email, 'password': password};

    final res = await http.post(Uri.parse('${Environment.apiUrl}/login'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    //print(res.body);
    autenticando = false;
    if (res.statusCode == 200) {
      final loginRes = loginResponseFromJson(res.body);
      usuario = loginRes.usuario;
      await _guardarToken(loginRes.token);
      return true;
    } else {
      return false;
    }
  }

  Future register(String name, String email, String password) async {
    autenticando = true;

    final data = {'name': name, 'email': email, 'password': password};

    final res = await http.post(Uri.parse('${Environment.apiUrl}/login/new'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    //print(res.body);
    autenticando = false;
    if (res.statusCode == 200) {
      final registerRes = loginResponseFromJson(res.body);
      usuario = registerRes.usuario;
      await _guardarToken(registerRes.token);
      return true;
    } else {
      final resBody = jsonDecode(res.body);
      return resBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    //TODO verificar bien esto
    var token = await _storage.read(key: 'token');

    if (token == null) {
      token = 'asdsd';
    }

    final res = await http.get(Uri.parse('${Environment.apiUrl}/login/renew'),
        headers: {'Content-Type': 'application/json', 'x-token': token});

    //print(res.body);
    autenticando = false;
    if (res.statusCode == 200) {
      final registerRes = loginResponseFromJson(res.body);
      usuario = registerRes.usuario;
      await _guardarToken(registerRes.token);
      return true;
    } else {
      logOut();
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logOut() async {
    await _storage.delete(key: 'token');
  }
}
