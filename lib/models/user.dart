class User {
  final int id;
  final String nomeCompleto;
  final String email;
  final DateTime dataNascimento;
  final String nomeUsuario;
  final String tipoUsuario;

  User({
    required this.id,
    required this.nomeCompleto,
    required this.email,
    required this.dataNascimento,
    required this.nomeUsuario,
    required this.tipoUsuario,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomeCompleto': nomeCompleto,
      'email': email,
      'dataNascimento': dataNascimento.toIso8601String(),
      'nomeUsuario': nomeUsuario,
      'tipoUsuario': tipoUsuario,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nomeCompleto: json['nomeCompleto'],
      email: json['email'],
      dataNascimento: DateTime.parse(json['dataNascimento']),
      nomeUsuario: json['nomeUsuario'],
      tipoUsuario: json['tipoUsuario'],
    );
  }

  bool isValid() {
    return nomeCompleto.isNotEmpty &&
        email.isNotEmpty &&
        dataNascimento != null &&
        nomeUsuario.isNotEmpty &&
        tipoUsuario.isNotEmpty;
  }
}
