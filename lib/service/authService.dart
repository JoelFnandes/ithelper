import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class AuthService {
  final String baseUrl =
      "http://192.168.1.2:8080"; // Usar o endereço IP da sua máquina host

  final FlutterSecureStorage _storage = FlutterSecureStorage();

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
      setToken(token);
      return getToken();
    } else {
      // Autenticação falhou, trate o erro
      throw Exception({response.reasonPhrase, "Usuário não existe"});
    }
  }

  Future<void> setToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'jwt_token');
  }

  Future<void> logout() async {
    // Implemente a lógica de logout, como limpar o token e realizar outras tarefas necessárias.
    await _storage.delete(key: 'jwt_token');
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
