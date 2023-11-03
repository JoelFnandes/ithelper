class User {
  final String id;
  final String fullName;
  final String email;
  final DateTime dateOfBirth;
  final String username;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'username': username,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      username: json['username'],
    );
  }

  bool isValid() {
    return id.isNotEmpty &&
        fullName.isNotEmpty &&
        email.isNotEmpty &&
        dateOfBirth != null &&
        username.isNotEmpty;
  }
}
