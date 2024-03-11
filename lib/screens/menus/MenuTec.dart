import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:provider/provider.dart';

import '../authentication/login.dart';

class MenuTec extends StatefulWidget {
  @override
  _MenuTecState createState() => _MenuTecState();
}

class _MenuTecState extends State<MenuTec> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: const CircleAvatar(),
              ),
              ),
            ListTile(
              title: Text('Página Inicial'),
              onTap: () {
                // Implemente a navegação para a página inicial
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Configurações'),
              onTap: () {
                // Implemente a navegação para a página de configurações
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Provider.of<AuthContext>(context, listen: false).logout();
                Provider.of<TicketData>(context, listen: false).clearData();
                 Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false,);
              },
            ),

          ],
        ),
      );   
}
}
