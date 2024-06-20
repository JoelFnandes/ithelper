import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/service/ticketService.dart';
import 'package:provider/provider.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:ithelper/models/ticketModel.dart';

class TicketController {
  final ticketService = TicketService();

  Future<void> addNewTicket(BuildContext context, TicketModel newTicket) async {
    try {
      // Obtém o contexto de autenticação
      final authContext = Provider.of<AuthContext>(context, listen: false);

      // Aguarda a carga do token
      await authContext
          .loadToken(); // Assegure-se de que isso está carregando corretamente

      // Verifique se o token não está inicializado
      if (authContext.token.isEmpty) {
        throw Exception('Token de autenticação não disponível.');
      }

      // Adiciona o ticket ao estado local
      Provider.of<TicketData>(context, listen: false).addTicket(newTicket);

      // Envia o novo ticket para o backend
      await ticketService.sendNewTicket(newTicket, authContext.token);

      // Lógica adicional após o envio bem-sucedido
      // Ex: mostrar mensagem de sucesso, atualizar estado, etc.
    } catch (e) {
      print('Erro ao criar o ticket: $e');
      // Lide com o erro, por exemplo, mostrando uma mensagem de erro para o usuário
    }
  }
}
