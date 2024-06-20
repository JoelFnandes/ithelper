import 'dart:convert';
import 'package:ithelper/models/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  final String baseUrl = "http://192.168.1.2:8080";

  Future<Employee?> fetchEmployeeByUserId(int userId, String token) async {
    var url = Uri.parse('$baseUrl/funcionario/byUserId/$userId');
    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        print("Deu certo mofi");
        return Employee.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to load employee');
        return null;
      }
    } catch (e) {
      print('Error fetching employee: $e');
      return null;
    }
  }
}
