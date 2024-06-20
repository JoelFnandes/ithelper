import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/screens/homes/homeTec.dart';
import 'package:ithelper/screens/menus/MenuTec.dart';
import 'package:ithelper/screens/menus/MenuUser.dart';
import 'package:provider/provider.dart';

void main() {
  // Defina a codificação padrão para UTF-8
  stdout.encoding = Encoding.getByName('utf-8')!;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthContext()),
        ChangeNotifierProvider(create: (context) => TicketData()),
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
      routes: {
        '/homeTec': (context) => HomeTec(),
        '/homeUser': (context) => HomeTec(),
        '/menuTec': (context) => MenuTec(),
        '/menuUser': (context) => MenuUser(),
      },
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
    );
  }
}
