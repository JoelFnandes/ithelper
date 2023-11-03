import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl =
      "http://192.168.1.7:8080"; // Use o endereço IP da sua máquina host

  Future<String?> authenticate(String username, String password) async {
    final url = Uri.parse(baseUrl + "/login");

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'login': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Autenticação bem-sucedida
      final String token = response.body; // O token é o corpo da resposta
      return token;
    } else {
      // Autenticação falhou, trate o erro
      String error = "Usuário não existe";
      throw Exception({response.reasonPhrase, error});
    }
  }
}
