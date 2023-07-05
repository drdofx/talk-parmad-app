import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateForumService {
  final String baseUrl;

  CreateForumService({required this.baseUrl});

  Future<Map<String, dynamic>> createForum(Map<String, dynamic> req) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwtToken');

    final url = Uri.parse('$baseUrl/forum/create');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final body = {
      'forum_name': req['forum_name'],
      'introduction_text': req['introduction_text'],
      'category': req['category'],
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

// class CreateThreadService {
//   final String baseUrl;

//   CreateThreadService({required this.baseUrl});

//   Future<Map<String, dynamic>> createThread(Map<String, dynamic> req) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('jwtToken');

//     final url = Uri.parse('$baseUrl/thread/create');
//     final headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     };

//     final body = {
//       'forum_id': req['forum_id'],
//       'title': req['title'],
//       'text': req['text'],
//     };

//     final response =
//         await http.post(url, headers: headers, body: json.encode(body));

//     if (response.statusCode == 200) {
//       // Successful response
//       return json.decode(response.body);
//     } else {
//       // Handle errors or non-200 status codes
//       throw Exception(response.body);
//     }
//   }
// }

class CreateReplyService {
  final String baseUrl;

  CreateReplyService({required this.baseUrl});

  Future<Map<String, dynamic>> createReply(Map<String, dynamic> req) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwtToken');

    final url = Uri.parse('$baseUrl/reply/create');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final body = {
      'thread_id': req['thread_id'],
      'text': req['text'],
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
