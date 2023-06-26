import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/forum_list.dart';
import 'package:talk_parmad/services/forum_list_service.dart';

class ForumListController extends ChangeNotifier {
  final ForumListService forumListService;

  ForumListController({
    required this.forumListService,
  });

  List<ForumData> _forumList = [];

  List<ForumData> get forumList => _forumList;

  Future<void> fetchForumListData() async {
    try {
      final response = await forumListService.fetchData();
      final responseData = response['data'] as List<dynamic>;
      print(responseData);
      final List<ForumData> updatedData =
          responseData.map((data) => ForumData.fromJson(data)).toList();

      _forumList = updatedData;
      notifyListeners();
    } catch (e) {
      print('Fetch forum list data failed: $e');
    }
  }

  Future<void> refreshData() async {
    // Call the API again to fetch the updated data
    await fetchForumListData();
  }
}
