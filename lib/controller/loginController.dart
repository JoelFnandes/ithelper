import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ithelper/models/employee.dart';
import 'package:ithelper/service/employeeService.dart';
import 'package:provider/provider.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:ithelper/models/ticketModel.dart';
import 'package:ithelper/models/user.dart';
import 'package:ithelper/service/authService.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/service/ticketService.dart';

class LoginController {
  final authService = AuthService();
  final ticketService = TicketService();
  final employeeService = EmployeeService();

  LoginController();

  Future<User?> login(
      BuildContext context, String username, String password) async {
    final authContext = Provider.of<AuthContext>(context, listen: false);
    try {
      final token = await authService.authenticate(username, password);
      if (token != null) {
        // Autenticação bem-sucedida

        // Obtem os detalhes do usuário após a autenticação
        final user = await fetchUserData(context, username,
            token); // Substitua pela função que busca os detalhes do usuário
        if (user != null) {
          final employee =
              await employeeService.fetchEmployeeByUserId(user.id, token);

          if (employee != null) {
            authContext.setFuncionario = employee;
          }
        }
        // Obtem os chamados vinculados ao usuario(se ele for tecnico pega todos em aberto)
        fetchTicketsData(context, user, token);

        return user;
      } else {
        // Token nulo, autenticação falhou
        return null;
      }
    } catch (e) {
      //exceção que possa ocorrer durante a autenticação
      print('Erro durante a autenticação: $e');
      return null;
    }
  }

  fetchUserData(BuildContext context, String username, String token) async {
    try {
      final userData = await authService.getUserData(username, token);

      if (userData != null) {
        final userDataMap = json.decode(userData);
        //verificar no debug console se aparece os dados
        print('Dados do usuário decodificados: $userDataMap');
        return User.fromJson(userDataMap);
      }
      print('Dados do usuário nulos');
      return null;
    } catch (e) {
      print('Erro ao buscar os dados do usuário: $e');
      return null;
    }
  }

  fetchTicketsData(BuildContext context, User user, String token) async {
    final ticketData = Provider.of<TicketData>(context, listen: false);

    try {
      final ticketsDataGet = await ticketService.getTicketsData(user, token);

      if (ticketsDataGet != null) {
        // Converter as strings em objetos TicketModel
        List<TicketModel> ticketsModels =
            ticketsDataGet.map((data) => TicketModel.fromJson(data)).toList();

        print('Dados dos tickets decodificados: $ticketsModels');
        // Adicionar os tickets à instância única da classe TicketData
        return ticketData.addListTickets(ticketsModels);
      }
    } catch (e) {
      print('Erro ao buscar os dados dos chamados: $e');
      return null;
    }
  }
}
