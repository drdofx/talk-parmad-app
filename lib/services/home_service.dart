import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeService {
  final String baseUrl;

  HomeService({required this.baseUrl});

  Future<Map<String, dynamic>> fetchData() async {
    final url = Uri.parse('$baseUrl/forum/list-thread');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODc2NzM3NzcsImlhdCI6MTY4NzY2Mjk3Nywic3ViIjoiMSIsImRhdGEiOnsiVXNlcklEIjoxLCJOYW1lIjoiVGVzdCIsIk5JTSI6IjEyMDEwMzAzOCIsIlJvbGUiOiJVc2VyIn19.cYuwVUIY9cudfvZNxaTo_7aabB3D7l9kwo663cYggDE'
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // Successful response
      return json.decode(response.body);
    } else {
      // Handle errors or non-200 status codes
      throw Exception(response.body);
    }
  }
}
