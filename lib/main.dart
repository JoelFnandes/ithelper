import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:provider/provider.dart'; // Importe o pacote provider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthContext(), // Crie uma instância de AuthContext
      child: MaterialApp(
        home: Login(),
        theme: ThemeData.dark(useMaterial3: true),
      ),
    ),
  );
}
