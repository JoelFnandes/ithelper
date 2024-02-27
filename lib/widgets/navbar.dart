import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/screens/homes/homeUser.dart';
import 'package:provider/provider.dart';

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
  NavigationBar build(BuildContext context) {
    // Lista de destinos padrão (sempre inclui Início e Notificações)
    String? userType = context.read<AuthContext>().user?.tipoUsuario;

    print(userType);
    List<NavigationDestination> destinations = [];
    destinations.add(
      NavigationDestination(
        icon: Icon(Icons.house),
        label: 'Início',
      ),
    );
    // Adiciona Chamados à lista de destinos se o tipo de usuário for tecnico
    if (userType == "T") {
      destinations.add(
        NavigationDestination(
          icon: Icon(Icons.folder),
          label: 'Chamados',
        ),
      );
    }
    destinations.add(NavigationDestination(
      icon: Icon(Icons.notification_important),
      label: 'Notificações',
    ));
    destinations.add(
      NavigationDestination(
        selectedIcon: Icon(Icons.person),
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    );
    return NavigationBar(
      labelBehavior: labelBehavior,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          print(index);
        });
        if (destinations.length > 3) {
          switch (index) {
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
          }
        } else {
          switch (index) {
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
          }
        }
      },
      destinations: destinations,
    );
  }
}
