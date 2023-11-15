import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:ithelper/models/user.dart';

class AuthContext with ChangeNotifier {
  bool isAuthenticated = false;
  User? user;

  void updateUser(User user) {
    this.user = user;
    isAuthenticated = true;
    notifyListeners();
    print(this.user?.nomeUsuario);
  }

  void logout() {
    user = null;
    isAuthenticated = false;
    notifyListeners();
  }
}
