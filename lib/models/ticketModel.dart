import 'dart:convert';

class TicketModel {
  final int id;
  final String nomeUsuario;
  final String tituloChamado;
  final String descricaoChamado;
  final DateTime dataHoraAbertura;
  final String prioridade;
  final String statusChamado;
  final DateTime dataHoraFechamento;
  final String nomeDepartamento;

  TicketModel(
      {required this.id,
      required this.nomeUsuario,
      required this.tituloChamado,
      required this.descricaoChamado,
      required this.dataHoraAbertura,
      required this.prioridade,
      required this.statusChamado,
      required this.dataHoraFechamento,
      required this.nomeDepartamento});

  Map<String, dynamic> toJson() {
    return {
      'idChamado': id, // Alterado para 'idChamado'
      'nomeUsuario': nomeUsuario,
      'tituloChamado': tituloChamado,
      'descricaoChamado': descricaoChamado,
      'dataHoraAbertura': dataHoraAbertura.toIso8601String(),
      'prioridade': prioridade,
      'statusChamado': statusChamado,
      'dataHoraFechamento': dataHoraFechamento.toIso8601String(),
      'nomeDepartamento': nomeDepartamento
    };
  }

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
        id: json['idChamado'] ?? 0, // Alterado para 'idChamado'
        nomeUsuario: json['nomeUsuario'] ?? '',
        tituloChamado: json['tituloChamado'] ?? '',
        descricaoChamado: json['descricaoChamado'] ?? '',
        dataHoraAbertura: json['dataHoraAbertura'] != null
            ? DateTime.parse(json['dataHoraAbertura'])
            : DateTime.now(),
        prioridade: json['prioridade'] ?? '',
        statusChamado: json['statusChamado'] ?? '',
        dataHoraFechamento: json['dataHoraFechamento'] != null
            ? DateTime.parse(json['dataHoraFechamento'])
            : DateTime.now(),
        nomeDepartamento: json['nomeDepartamento'] ?? '');
  }

  factory TicketModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> decodedJson = json.decode(jsonString);

    return TicketModel(
        id: decodedJson['idChamado'] ?? 0,
        nomeUsuario: decodedJson['nomeUsuario'] ?? '',
        tituloChamado: decodedJson['tituloChamado'] ?? '',
        descricaoChamado: decodedJson['descricaoChamado'] ?? '',
        dataHoraAbertura: decodedJson['dataHoraAbertura'] != null
            ? DateTime.parse(decodedJson['dataHoraAbertura'])
            : DateTime.now(),
        prioridade: decodedJson['prioridade'] ?? '',
        statusChamado: decodedJson['statusChamado'] ?? '',
        dataHoraFechamento: decodedJson['dataHoraFechamento'] != null
            ? DateTime.parse(decodedJson['dataHoraFechamento'])
            : DateTime.now(),
        nomeDepartamento: decodedJson['nomeDepartamento'] ?? '');
  }

  bool isValid() {
    return tituloChamado.isNotEmpty &&
        descricaoChamado.isNotEmpty &&
        dataHoraAbertura != null &&
        prioridade.isNotEmpty &&
        statusChamado.isNotEmpty &&
        dataHoraFechamento != null;
  }
}
