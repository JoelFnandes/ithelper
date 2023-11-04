import 'package:flutter/material.dart';
import 'package:ithelper/models/user.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/screens/home.dart';

void main() {
  runApp(
    AuthContext(
      // Defina o status de autenticação
      isAuthenticated: false,
      child: MaterialApp(
        home: Login(),
        theme: ThemeData.dark(useMaterial3: true),
      ),
    ),
  );
}
