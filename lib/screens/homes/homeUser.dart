import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:ithelper/models/user.dart';
import 'package:ithelper/screens/authentication/login.dart';
import 'package:ithelper/widgets/createTicket.dart';
import 'package:ithelper/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'package:ithelper/widgets/ticketCard.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> teste = ["", ""];
    return Scaffold(
      backgroundColor: Color(0xFF141218),
      body: Stack(
        children: [
          Center(
            child: Consumer<TicketData>(
              builder: (context, ticketData, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Alinhe ao centro horizontalmente
                  children: <Widget>[
                    SizedBox(height: 50),
                    // Card Chamados
                    SizedBox(
                      height: 80,
                      width: 328,
                      child: Card(
                        color: Color(0xFF211F26),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Container(
                                width: 48, // Largura do contador
                                height: 48, // Altura do contador
                                child: Badge.count(
                                  count: ticketData
                                      .getTicketsFuncio(context)
                                      .length,
                                  textStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      15), // Espaço entre o contador e o texto
                              Text(
                                "Notificações", // Texto "Chamados"
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Text(
                            "Meus últimos chamados",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Ver mais",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    for (var ticket in ticketData.getTicketsFuncio(context))
                      TicketCard(
                        ticket.tituloChamado,
                        ticket.nomeDepartamento,
                        ticket.statusChamado,
                        ticket.prioridade,
                        ticket.nomeUsuario,
                        "Tecnico",
                        ticket.dataHoraAbertura,
                        ticket.descricaoChamado,
                        teste,
                      ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateTicket()),
                );
              },
              tooltip: 'Criar Chamado',
              child: Icon(Icons.add),
              backgroundColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationExample(context),
    );
  }
}
