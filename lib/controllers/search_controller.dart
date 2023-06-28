import 'package:flutter/foundation.dart';
import 'package:talk_parmad/services/search_service.dart';

class SearchForumController extends ChangeNotifier {
  final SearchForumService searchForumService;

  SearchForumController({
    required this.searchForumService,
  });

  Future<List<dynamic>> searchForums(Map<String, dynamic> data) async {
    try {
      final response = await searchForumService.searchForums(data);
      final responseData = response['data'] as List<dynamic>;

      print(responseData);

      notifyListeners();

      return responseData;
    } catch (e) {
      print('Create forum failed: $e');
      return [];
    }
  }
}
