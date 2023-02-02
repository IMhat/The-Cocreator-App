import 'package:cocreator/global/environment.dart';
import 'package:cocreator/models/usuario.dart';
import 'package:cocreator/models/usuarios_response.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final uri = Uri.parse('${ Environment.apiUrl }/usuarios');
      final resp = await http.get(uri,
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        }
      );

      print(AuthService.getToken());

      final usuariosResponse = usuariosResponseFromJson(resp.body);
      print(usuariosResponse.usuarios);
      return usuariosResponse.usuarios;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}