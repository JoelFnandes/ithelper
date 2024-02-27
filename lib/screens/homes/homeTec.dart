import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/models/user.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/widgets/navbar.dart';
import 'package:ithelper/widgets/ticketCard.dart';
import 'package:ithelper/data/ticketData.dart'; // Importe a classe TicketData
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
        child: Consumer<TicketData>(
          builder: (context, ticketData, child) {
            print("Tickets abertos: ${ticketData.getOpenTickets()}");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
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
                            width: 50,
                            height: 50,
                            child: Badge.count(
                              count: ticketData.getOpenTickets().length,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Chamados",
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
                            "Patrimônio",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
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
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Text(
                        "Chamados por setor",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Ver mais",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Agora, use a lista de tickets de ticketData
                for (var ticket in ticketData.getOpenTickets())
                  TicketCard(
                  ticket.descricaoChamado,
                    ticket.statusChamado,
                    ticket.prioridade,
                  ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationExample(),
    );
  }
}
