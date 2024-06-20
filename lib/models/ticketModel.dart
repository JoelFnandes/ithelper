import 'dart:convert';

class TicketModel {
  final int idChamado;
  final String nomeUsuario;
  final String tituloChamado;
  final String descricaoChamado;
  final DateTime dataHoraAbertura;
  final String prioridade;
  final String statusChamado;
  final DateTime? dataHoraFechamento; // Allow null
  final String nomeDepartamento;
  final int idFuncionario;

  TicketModel({
    required this.idChamado,
    required this.nomeUsuario,
    required this.tituloChamado,
    required this.descricaoChamado,
    required this.dataHoraAbertura,
    required this.prioridade,
    required this.statusChamado,
    this.dataHoraFechamento, // Allow null
    required this.nomeDepartamento,
    required this.idFuncionario,
  });

  Map<String, dynamic> toJson() {
    return {
      'idChamado': idChamado,
      'nomeUsuario': nomeUsuario,
      'tituloChamado': tituloChamado,
      'descricaoChamado': descricaoChamado,
      'dataHoraAbertura': dataHoraAbertura.toIso8601String(),
      'prioridade': prioridade,
      'statusChamado': statusChamado,
      'dataHoraFechamento':
          dataHoraFechamento?.toIso8601String(), // Handle null
      'nomeDepartamento': nomeDepartamento,
      'funcionario': {'idFuncionario': idFuncionario},
    };
  }

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      idChamado: json['idChamado'] ?? 0,
      nomeUsuario: json['nomeUsuario'] ?? '',
      tituloChamado: json['tituloChamado'] ?? '',
      descricaoChamado: json['descricaoChamado'] ?? '',
      dataHoraAbertura: DateTime.parse(json['dataHoraAbertura']),
      prioridade: json['prioridade'] ?? '',
      statusChamado: json['statusChamado'] ?? '',
      dataHoraFechamento: json['dataHoraFechamento'] != null
          ? DateTime.parse(json['dataHoraFechamento'])
          : null, // Handle null
      nomeDepartamento: json['nomeDepartamento'] ?? '',
      idFuncionario: json['funcionario']?['idFuncionario'] ?? 0,
    );
  }

  factory TicketModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> decodedJson = json.decode(jsonString);

    return TicketModel(
      idChamado: decodedJson['idChamado'] ?? 0,
      nomeUsuario: decodedJson['nomeUsuario'] ?? '',
      tituloChamado: decodedJson['tituloChamado'] ?? '',
      descricaoChamado: decodedJson['descricaoChamado'] ?? '',
      dataHoraAbertura: DateTime.parse(decodedJson['dataHoraAbertura']),
      prioridade: decodedJson['prioridade'] ?? '',
      statusChamado: decodedJson['statusChamado'] ?? '',
      dataHoraFechamento: decodedJson['dataHoraFechamento'] != null
          ? DateTime.parse(decodedJson['dataHoraFechamento'])
          : null, // Handle null
      nomeDepartamento: decodedJson['nomeDepartamento'] ?? '',
      idFuncionario: decodedJson['funcionario']?['idFuncionario'] ?? 0,
    );
  }

  bool isValid() {
    return tituloChamado.isNotEmpty &&
        descricaoChamado.isNotEmpty &&
        dataHoraAbertura != null &&
        prioridade.isNotEmpty &&
        statusChamado.isNotEmpty;
  }
}
