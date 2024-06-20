import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:ithelper/models/employee.dart';
import 'package:ithelper/models/user.dart';
import 'package:ithelper/service/authService.dart';

class AuthContext with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool isAuthenticated = false;
  Employee? _funcionario;
  User? _user;
  late String _token;

  String get token {
    if (_token == null) {
      throw Exception('Token has not been initialized');
    }
    return _token;
  }

  set setFuncionario(Employee funcionario) {
    _funcionario = funcionario;
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    _token = token;
    // Além de armazenar localmente, você pode querer realizar outras ações, como notificar ou atualizar outros estados.
    await _authService.setToken(token);
    notifyListeners();
  }

  Future<void> loadToken() async {
    _token = (await _authService.getToken())!;
    notifyListeners();
  }

  Future<void> logout() async {
    // Realize a lógica de logout e atualize o estado.
    await _authService.logout();
    _token = "";
    this._user = null;
    isAuthenticated = false;
    notifyListeners();
    notifyListeners();
  }

  void updateUser(User user) {
    this._user = user;
    isAuthenticated = true;
    notifyListeners();
    print(this._user?.nomeUsuario);
  }

  String? getNomeUser() {
    return _user?.nomeUsuario;
  }

  String? getTipoUser() {
    return _user?.tipoUsuario;
  }

  String? getNomeCompleto() {
    return _user?.nomeCompleto;
  }

  String? getEmailUser() {
    return _user?.email;
  }

  DateTime? getDataNascimento() {
    return _user?.dataNascimento;
  }

  int? getIdFuncionario() {
    return _funcionario?.idFuncionario;
  }

  String? getCargoFuncionario() {
    return _funcionario?.cargoFuncionario;
  }

  String? getNomeDepartamentoFuncionario() {
    return _funcionario?.nomeDepartamento;
  }
}
