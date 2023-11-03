import 'package:flutter/material.dart';
import 'package:ithelper/screens/authentication/login.dart';
import '../widgets/navbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Alinha ao centro verticalmente
          children: [
            Text('Welcome to the Home Page!'),
            SizedBox(
              height: 30,
            ),
            FilledButton.tonal(
              child: const Text("Login"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationExample(),
    );
  }
}
