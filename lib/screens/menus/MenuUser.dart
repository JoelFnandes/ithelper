import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:provider/provider.dart';

import '../authentication/login.dart';

class MenuUser extends StatefulWidget {
  @override
  _MenuUserState createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  @override
  Widget build(BuildContext context) {
    String? nomeUser =
        Provider.of<AuthContext>(context, listen: false).getNomeUser();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 30, 20),
                  child: const CircleAvatar(radius: 40, backgroundImage: NetworkImage("https://s2.glbimg.com/NO_M4iaJsCFNGREcDgjwuyXQ5f8=/smart/e.glbimg.com/og/ed/f/original/2019/07/24/wesley_snipes_blade.jpg"),),
                ),
                Text(nomeUser!, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.surface)), 
              ])),
          ListTile(
            title: Text(
              'Página Inicial',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              // Implemente a navegação para a página inicial
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              // Implemente a navegação para a página de configurações
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Sair',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Provider.of<AuthContext>(context, listen: false).logout();
              Provider.of<TicketData>(context, listen: false).clearData();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
}
}
