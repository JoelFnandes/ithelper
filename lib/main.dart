import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:provider/provider.dart'; // Importe o pacote provider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthContext(), // Crie uma instância de AuthContext
      child:
          MyApp(), // Use a classe MyApp como o widget principal do seu aplicativo
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(), // Substitua pelo widget inicial do seu aplicativo
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
