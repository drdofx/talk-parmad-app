import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl;

  AuthService({required this.baseUrl});

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      'user': username,
      'password': password,
    };

    final response =
        await http.post(url, headers: headers, body: json.encode(body));

    if (response.statusCode == 200) {
      // Successful response
      return json.decode(response.body);
    } else {
      // Handle errors or non-200 status codes
      throw Exception(response.body);
    }
  }

  // Register
  Future<Map<String, dynamic>> register(
      String nim, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      'email': email,
      'nim': nim,
      'password': password,
    };

    final response =
        await http.post(url, headers: headers, body: json.encode(body));

    if (response.statusCode == 200) {
      // Successful response
      return json.decode(response.body);
    } else {
      // Handle errors or non-200 status codes
      throw Exception(response.body);
    }
  }
}
