import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:ithelper/screens/homes/homeTec.dart';
import 'package:ithelper/widgets/navbar.dart';
import 'package:provider/provider.dart';

import '../authentication/login.dart';

class MenuTec extends StatefulWidget {
  @override
  _MenuTecState createState() => _MenuTecState();
}

class _MenuTecState extends State<MenuTec> {
  @override
  Widget build(BuildContext context) {
    String? nomeUser =
        Provider.of<AuthContext>(context, listen: false).getNomeUser();

    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
        child: HomeTec(context)),
        Positioned(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
            child:Align(
            alignment:
                Alignment.centerRight, // Ajusta a posição para a metade direita
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.5, // Define a largura do Drawer como metade da largura da tela
              child: Drawer(
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    "https://s2.glbimg.com/NO_M4iaJsCFNGREcDgjwuyXQ5f8=/smart/e.glbimg.com/og/ed/f/original/2019/07/24/wesley_snipes_blade.jpg"),
                              ),
                            ),
                            Text(
                              nomeUser!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Página Inicial',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          // Obtenha a instância do NavigationBar do contexto
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Configurações',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          // Implemente a navegação para a página de configurações
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Sair',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Provider.of<AuthContext>(context, listen: false)
                              .logout();
                          Provider.of<TicketData>(context, listen: false)
                              .clearData();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
        )
      ]),
    );
  }
}
