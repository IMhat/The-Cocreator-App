import 'package:cocreator/global/environment.dart';
import 'package:cocreator/models/usuarios.dart';
import 'package:cocreator/models/usuarios_response.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get(Uri.parse('${Environment.apiUrl}/usuarios'),
          headers: {
            'Content-type': 'application/json',
            'x-token': await AuthServices.getToken()
          });

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
