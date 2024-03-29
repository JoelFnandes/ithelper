import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/screens/homes/homeTec.dart';
import 'package:ithelper/screens/menus/MenuTec.dart';
import 'package:ithelper/screens/menus/MenuUser.dart';
import 'package:provider/provider.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample(BuildContext context,{super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

   final GlobalKey<_NavigationExampleState> navigationBarKey = GlobalKey<_NavigationExampleState>();
  @override
  NavigationBar build(BuildContext context)  {
    // Lista de destinos padrão (sempre inclui Início e Notificações)
    String? userType = context.read<AuthContext>().getTipoUser();

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
      key: navigationBarKey,
      labelBehavior: labelBehavior,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          print(index);
        });
        if (destinations.length > 3) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeTec(context)),
              );
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuTec()),
              );
          }
        } else {
          switch (index) {
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuUser()),
              );
          }
          
        }
        
      },
      
      destinations: destinations,
    );
  }

  void setCurrentPage(int current){
    currentPageIndex = current;
  }
}
