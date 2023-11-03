import 'package:flutter/material.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/screens/home.dart';

void main() {
  runApp(MaterialApp(home: Login(), theme: ThemeData.dark(useMaterial3: true)));
}
