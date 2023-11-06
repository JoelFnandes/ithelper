import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:ithelper/models/user.dart';
import 'package:ithelper/screens/homes/homeTec.dart';

class AuthContext with ChangeNotifier {
  bool isAuthenticated = false;
  User? user;

  void updateUser(User user) {
    this.user = user;
    isAuthenticated = true;
    notifyListeners();
    print(this.user?.nomeUsuario);
  }
}
