import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/models/ticketModel.dart';
import 'package:provider/provider.dart';

class TicketData with ChangeNotifier {
  List<TicketModel> ticketData = [];

  // Adiciona um ticket à lista
  void addTicket(TicketModel ticket) {
    ticketData.add(ticket);
    notifyListeners(); // Notifica os ouvintes sobre a mudança nos dados
  }

  // Adiciona uma lista de tickets à lista existente
  void addListTickets(List<TicketModel> tickets) {
    //print("addListTickets chamada com a seguinte lista: $tickets");
    ticketData.addAll(tickets);
    notifyListeners(); // Notifica os ouvintes sobre a mudança nos dados
  }

  // Retorna todos os tickets pendentes
  List<TicketModel> getOpenTickets() {
    //print("Lista de tickets antes do filtro: $ticketData");
    //print("getOpenTickets() chamado");
    List<TicketModel> openTickets =
        ticketData.where((ticket) => ticket.statusChamado == 'P').toList();
    //print("Tickets pendentes antes de retornar: $openTickets");
    return openTickets;
  }

  // Retorna todos os tickets criados pelo usuário comum (Funcionario)
  List<TicketModel> getTicketsFuncio(BuildContext context) {
    AuthContext authContext = Provider.of(context, listen: false);

    List<TicketModel> vincuTickets = ticketData
        .where((ticket) => ticket.nomeUsuario == authContext.getNomeUser())
        .toList();

    return vincuTickets;
  }

  void clearData() {
    ticketData.clear();
    notifyListeners();
  }
}
