import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ForumDetailService {
  final String baseUrl;

  ForumDetailService({required this.baseUrl});

  Future<Map<String, dynamic>> getForumDetail(Map<String, dynamic> req) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwtToken');

    final forumId = req['forum_id'];
    final url = Uri.parse('$baseUrl/forum/detail?id=$forumId');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // final body = {'forum_id': 12};

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
