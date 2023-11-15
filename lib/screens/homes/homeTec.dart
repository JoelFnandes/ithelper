import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/models/user.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/widgets/navbar.dart';
import 'package:ithelper/widgets/ticketCard.dart';
import 'package:provider/provider.dart'; // Importe o provider

class HomeTec extends StatelessWidget {
  const HomeTec({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141218),
      body: Center(
        child: Column(
          // Alinhe ao centro verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.center, // Alinhe ao centro horizontalmente
          children: <Widget>[
            SizedBox(height: 50),
            //Card Chamdados
            SizedBox(
              height: 80,
              width: 328,
              child: Card(
                color: Color(0xFF211F26),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50, // Largura do contador
                        height: 50, // Altura do contador
                        child: Badge.count(
                            count: 25,
                            textStyle: Theme.of(context).textTheme.titleLarge),
                      ),
                      SizedBox(width: 15), // Espaço entre o contador e o texto
                      Text(
                        "Chamados", // Texto "Chamados"
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Card Patrimonio
              SizedBox(
                  height: 80,
                  width: 156,
                  child: Card(
                      color: Color(0xFF211F26),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          SizedBox(width: 15),
                          Text(
                            "Patrimonio",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ))),
              //Espaço entre Patrimonio e Setores
              SizedBox(width: 16),
              //Card Setores
              SizedBox(
                  height: 80,
                  width: 156,
                  child: Card(
                      color: Color(0xFF211F26),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          SizedBox(width: 15),
                          Text(
                            "Setores",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ))),
            ]),
            SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SizedBox(
                child: Text(
                  "Chamados por setor",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Ver mais",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ))),
            ]),
            TicketCard("Sala 5", "Danilo", 3),
            TicketCard("Sala 5", "Danilo", 3),
            TicketCard("Sala 5", "Danilo", 3),
            TicketCard("Sala 5", "Danilo", 3),
            // Text(
            //   "Bem-vindo, ${authContext.user?.nomeUsuario}",
            //   style: TextStyle(fontSize: 20),
            // ),
            // SizedBox(height: 10),
            // FilledButton.tonal(
            //   child: const Text("Login"),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Login()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationExample(),
    );
  }
}
