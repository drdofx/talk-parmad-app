import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchForumService {
  final String baseUrl;

  SearchForumService({required this.baseUrl});

  Future<Map<String, dynamic>> searchForums(Map<String, dynamic> req) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwtToken');

    final forumName = req['forum_name'];
    final url = Uri.parse('$baseUrl/forum/search?forum_name=$forumName');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // final body = {
    //   'forum_name': req['forum_name'],
    //   'category': req['category'],
    // };

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
