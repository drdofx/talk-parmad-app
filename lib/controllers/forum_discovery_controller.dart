import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/forum_list.dart';
import 'package:talk_parmad/services/forum_discovery_service.dart';

class ForumDiscoveryController extends ChangeNotifier {
  final ForumDiscoveryService forumDiscoveryService;

  ForumDiscoveryController({
    required this.forumDiscoveryService,
  });

  List<ForumData> _forumList = [];

  List<ForumData> get forumList => _forumList;

  Future<void> fetchForumListData() async {
    try {
      final response = await forumDiscoveryService.fetchData();
      final responseData = response['data'] as List<dynamic>;

      final List<ForumData> updatedData =
          responseData.map((data) => ForumData.fromJson(data)).toList();

      _forumList = updatedData;
      notifyListeners();
    } catch (e) {
      print('Fetch forum discovery list data failed: $e');
      _forumList = [];
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    // Call the API again to fetch the updated data
    await fetchForumListData();
  }
}
