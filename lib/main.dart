import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:provider/provider.dart';

void main() {
  // Defina a codificação padrão para UTF-8
  stdout.encoding = Encoding.getByName('utf-8')!;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthContext()),
        ChangeNotifierProvider(
            create: (context) =>
                TicketData()), // Adicione o TicketData ao provedor
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
