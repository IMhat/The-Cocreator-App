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

  // Getters del token de forma estática
  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token.toString();
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {'email': email, 'password': password};

    final uri = Uri.parse('${Environment.apiUrl}/login');
    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      print(loginResponse.token.toString());

      await this._guardarToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
  }

  Future register(String name, String email, String password) async {
    this.autenticando = true;

    final data = {'name': name, 'email': email, 'password': password};

    final uri = Uri.parse('${Environment.apiUrl}/login/new');
    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      await this._guardarToken(loginResponse.token);

      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      print(respBody);
      return respBody['msg'] == null ? 'Error interno' : respBody['msg'];
    }
  }

  Future updateUser(
      String business, String name, String employees, String roles) async {
    // this.autenticando = true;

    final data = {
      'business': business,
      'businessName': name,
      'employees': employees,
      'roles': roles
    };

    final uri = Uri.parse('${Environment.apiUrl}/login/update');
    final resp = await http.post(uri, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthServices.getToken()
    });

    // this.autenticando = false;
    print(resp.statusCode);

    if (resp.statusCode == 200) {
      // final loginResponse = loginResponseFromJson(resp.body);
      // usuario = loginResponse.usuario;
      //final respBody = jsonDecode(resp.body);

      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      print(respBody);
      return respBody['msg'] == null ? 'Error interno' : respBody['msg'];
    }
  }

  // Future<bool> isLoggedIn() async {
  //   //TODO verificar bien esto
  //   var token = await _storage.read(key: 'token');

  //   if (token == null) {
  //     token = 'asdsd';
  //   }

  //   final res = await http.get(Uri.parse('${Environment.apiUrl}/login/renew'),
  //       headers: {'Content-Type': 'application/json', 'x-token': token});

  //   //print(res.body);
  //   autenticando = false;
  //   if (res.statusCode == 200) {
  //     final registerRes = loginResponseFromJson(res.body);
  //     usuario = registerRes.usuario;
  //     await _guardarToken(registerRes.token);
  //     return true;
  //   } else {
  //     logOut();
  //     return false;
  //   }
  // }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token') ?? '';

    final uri = Uri.parse('${Environment.apiUrl}/login/renew');
    final resp = await http.get(uri,
        headers: {'Content-Type': 'application/json', 'x-token': token});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);

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
