import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthQuickbookService with ChangeNotifier {
  final _storage2 = FlutterSecureStorage();

  // Getters del token de forma estática
  static Future<String> getQuickbooksToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'quickbooksToken');
    return token.toString();
  }

  static Future<void> deleteQuickbooksToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'quickbooksToken');
  }

  Future logOut() async {
    await _storage2.delete(key: 'quickbooksToken');
  }
}
