import 'dart:convert';


class TicketModel {
  final int id;
  final int idFuncionario;
  final String descricaoChamado;
  final DateTime dataHoraAbertura;
  final String prioridade;
  final String statusChamado;
  final DateTime dataHoraFechamento;

  TicketModel({
    required this.id,
    required this.idFuncionario,
    required this.descricaoChamado,
    required this.dataHoraAbertura,
    required this.prioridade,
    required this.statusChamado,
    required this.dataHoraFechamento,
  });

  Map<String, dynamic> toJson() {
    return {
      'idChamado': id, // Alterado para 'idChamado'
      'funcionario': {'idFuncionario': idFuncionario},
      'descricaoChamado': descricaoChamado,
      'dataHoraAbertura': dataHoraAbertura.toIso8601String(),
      'prioridade': prioridade,
      'statusChamado': statusChamado,
      'dataHoraFechamento': dataHoraFechamento.toIso8601String(),
    };
  }

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['idChamado'] ?? 0, // Alterado para 'idChamado'
      idFuncionario: json['funcionario']['idFuncionario'] ?? 0,
      descricaoChamado: json['descricaoChamado'] ?? '',
      dataHoraAbertura: json['dataHoraAbertura'] != null
          ? DateTime.parse(json['dataHoraAbertura'])
          : DateTime.now(),
      prioridade: json['prioridade'] ?? '',
      statusChamado: json['statusChamado'] ?? '',
      dataHoraFechamento: json['dataHoraFechamento'] != null
          ? DateTime.parse(json['dataHoraFechamento'])
          : DateTime.now(),
    );
  }

  factory TicketModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> decodedJson = json.decode(jsonString);

    return TicketModel(
      id: decodedJson['idChamado'] ?? 0,
      idFuncionario: decodedJson['funcionario']['idFuncionario'] ?? 0,
      descricaoChamado: decodedJson['descricaoChamado'] ?? '',
      dataHoraAbertura: decodedJson['dataHoraAbertura'] != null
          ? DateTime.parse(decodedJson['dataHoraAbertura'])
          : DateTime.now(),
      prioridade: decodedJson['prioridade'] ?? '',
      statusChamado: decodedJson['statusChamado'] ?? '',
      dataHoraFechamento: decodedJson['dataHoraFechamento'] != null
          ? DateTime.parse(decodedJson['dataHoraFechamento'])
          : DateTime.now(),
    );
  }

  bool isValid() {
    return descricaoChamado.isNotEmpty &&
        dataHoraAbertura != null &&
        prioridade.isNotEmpty &&
        statusChamado.isNotEmpty &&
        dataHoraFechamento != null;
  }
}
