import 'package:flutter/widgets.dart';
import 'package:ithelper/models/user.dart';

class AuthContext extends InheritedWidget {
  final bool isAuthenticated;
  final User? user; // Tornar o usuário opcional

  AuthContext({
    required Widget child,
    required this.isAuthenticated,
    this.user, // Tornar o usuário opcional
  }) : super(child: child);

  static AuthContext of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthContext>()!;
  }

  @override
  bool updateShouldNotify(covariant AuthContext oldWidget) {
    return isAuthenticated != oldWidget.isAuthenticated;
  }

  void updateUser(User user) {}
}
