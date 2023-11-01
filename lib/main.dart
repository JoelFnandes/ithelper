import 'package:flutter/material.dart';
import 'package:ithelper/ui/authentication/login.dart';
import 'package:ithelper/ui/home.dart';

import 'ui/navbar.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de pessoas",
      home: Login(),
      theme: ThemeData.dark(useMaterial3: true)));
}
