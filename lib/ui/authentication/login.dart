import 'package:flutter/material.dart';
import 'package:ithelper/ui/widgets/textfields.dart';

import '../widgets/buttons.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ITHelper"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              TextFieldSample(labelText: "Nome de Usuário"),
              SizedBox(height: 30),
              PasswordTextField(labelText: "Senha"),
              SizedBox(height: 30),
              FilledButtonApp(textButton: "Entrar"),
            ],
          ),
        ),
      ),
    );
  }
}
