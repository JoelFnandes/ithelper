import 'package:flutter/material.dart';
import 'navbar.dart'; // Importe o arquivo com a barra de navegação

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Conteúdo da página Home
          Text('Welcome to the Home Page!'),
          // Adicione o conteúdo da página aqui
        ],
      ),
      bottomNavigationBar: NavigationExample(),
    );
  }
}
