import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ithelper/models/ticketModel.dart';
import 'package:ithelper/models/user.dart';

class TicketService {
  final String baseUrl = "http://192.168.1.2:8080";

  Future<List<Map<String, dynamic>>?> getTicketsData(
      User user, String token) async {
    late Uri url;

    if (user.tipoUsuario == "T") {
      url = Uri.parse('$baseUrl/chamados/abertos');
    }

    if (user.tipoUsuario == "U") {
      url = Uri.parse('$baseUrl/chamados/vinculados/${user.nomeUsuario}');
    }

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    print('API Response: ${json.decode(utf8.decode(response.bodyBytes))}');

    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonResponse = json.decode(decodedData);
      List<Map<String, dynamic>> ticketsData =
          jsonResponse.cast<Map<String, dynamic>>();
      return ticketsData;
    } else {
      throw Exception(
          'Dados não encontrados. Motivo: ${response.reasonPhrase}');
    }
  }

  Future<void> sendNewTicket(TicketModel ticket, String token) async {
    final url = Uri.parse('$baseUrl/chamados/criarChamado');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: json.encode(ticket.toJson()),
    );

    if (response.statusCode == 201) {
      print('Ticket criado com sucesso');
    } else {
      throw Exception(
          'Erro ao criar o ticket. Motivo: ${response.reasonPhrase}');
    }
  }
}
