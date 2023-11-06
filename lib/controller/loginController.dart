import 'dart:convert';

import 'package:ithelper/models/user.dart';
import 'package:ithelper/service/authService.dart';
import 'package:ithelper/authContext.dart';

class LoginController {
  final AuthService authService;
  final AuthContext? authContext;

  LoginController(this.authService, this.authContext);

  Future<AuthContext?> login(String username, String password) async {
    try {
      final token = await authService.authenticate(username, password);
      if (token != null) {
        // Autenticação bem-sucedida

        // Obtem os detalhes do usuário após a autenticação
        final user = await fetchUserData(username,
            token); // Substitua pela função que busca os detalhes do usuário

        // atualiza o AuthContext com os detalhes do usuário
        authContext?.updateUser(user);

        return authContext;
      } else {
        // Token nulo, autenticação falhou
        return null;
      }
    } catch (e) {
      //exceção que possa ocorrer durante a autenticação
      print('Erro durante a autenticação: $e');
      return null;
    }
  }

  fetchUserData(String username, String token) async {
    try {
      final userData = await authService.getUserData(username, token);

      if (userData != null) {
        final userDataMap = json.decode(userData);
        print('Dados do usuário decodificados: $userDataMap');
        return User.fromJson(userDataMap);
      }
      print('Dados do usuário nulos');
      return null;
    } catch (e) {
      print('Erro ao buscar os dados do usuário: $e');
      return null;
    }
  }
}
