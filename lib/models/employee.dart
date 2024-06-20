class Employee {
  final int idFuncionario;
  final String cargoFuncionario;
  final int idDepartamento;
  final int idUsuario;
  final String nomeDepartamento;

  Employee({
    required this.idFuncionario,
    required this.cargoFuncionario,
    required this.idDepartamento,
    required this.idUsuario,
    required this.nomeDepartamento,
  });

  // Método para criar um Employee a partir de um Map (conveniente para deserialização JSON)
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      idFuncionario: json['idFuncionario'],
      cargoFuncionario: json['cargoFuncionario'],
      idDepartamento: json['idDepartamento'],
      idUsuario: json['idUsuario'],
      nomeDepartamento: json['nomeDepartamento'],
    );
  }

  // Método para converter um Employee para um Map (conveniente para serialização JSON)
  Map<String, dynamic> toJson() {
    return {
      'idFuncionario': idFuncionario,
      'cargoFuncionario': cargoFuncionario,
      'idDepartamento': idDepartamento,
      'idUsuario': idUsuario,
      'nomeDepartamento': nomeDepartamento,
    };
  }

  int getIdFuncion() {
    return idFuncionario;
  }
}
