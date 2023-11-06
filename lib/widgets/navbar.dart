import 'package:flutter/material.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/screens/homes/homeUser.dart';

/// Flutter code sample for [NavigationBar].

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 1;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: labelBehavior,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          print(index);
        });
        switch (index) {
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
        }
      },
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.house),
          label: 'Início',
        ),
        NavigationDestination(
          icon: Icon(Icons.folder),
          label: 'Chamados',
        ),
        NavigationDestination(
          icon: Icon(Icons.notification_important),
          label: 'Notificações',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person),
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
