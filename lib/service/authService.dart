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

    // Autenticação bem-sucedida
    if (response.statusCode == 200) {
      final String token = response.body; // O token é o corpo da resposta

      return token;
    } else {
      // Autenticação falhou, trate o erro
      throw Exception({response.reasonPhrase, "Usuário não existe"});
    }
  }

  Future<String?> getUserData(String username, String token) async {
    final url = Uri.parse(baseUrl + "/users/" + username);

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception({response.reasonPhrase, "Dados não encontrados"});
    }
  }
}
