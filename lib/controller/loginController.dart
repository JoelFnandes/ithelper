import '../service/authService.dart';

class LoginController {
  final AuthService authService;

  LoginController(this.authService);

  Future<bool> login(String username, String password) async {
    try {
      final token = await authService.authenticate(username, password);
      if (token != null) {
        // Autenticação bem-sucedida
        return true;
      } else {
        // Token nulo, autenticação falhou
        return false;
      }
    } catch (e) {
      // Trate qualquer exceção que possa ocorrer durante a autenticação
      print('Erro durante a autenticação: $e');
      return false;
    }
  }
}
