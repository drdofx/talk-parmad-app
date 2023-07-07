import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/forum.dart';
import 'package:talk_parmad/services/search_service.dart';

class SearchForumController extends ChangeNotifier {
  final SearchForumService searchForumService;

  SearchForumController({
    required this.searchForumService,
  });

  List<ForumDetailForum> _searchForum = [];

  List<ForumDetailForum> get searchForum => _searchForum;

  Future<void> searchForums(Map<String, dynamic> data) async {
    try {
      final response = await searchForumService.searchForums(data);
      final responseData = response['data'] as List<dynamic>;

      print(responseData);
      final updatedData = responseData
          .map((data) => ForumDetailForum.fromSearchJson(data))
          .toList();

      _searchForum = updatedData;

      notifyListeners();
    } catch (e) {
      print('Search forum failed: $e');
    }
  }

  Future<void> refreshData(Map<String, dynamic> data) async {
    // Call the API again to fetch the updated data
    await searchForums(data);
  }
}
