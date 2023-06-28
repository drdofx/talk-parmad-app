import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/reply_profile.dart';
import 'package:talk_parmad/models/thread_profile.dart';
import 'package:talk_parmad/services/profile_service.dart';

class UserThreadListController extends ChangeNotifier {
  final UserThreadListService userThreadListService;

  UserThreadListController({
    required this.userThreadListService,
  });

  List<ThreadProfile> _threadList = [];

  List<ThreadProfile> get threadList => _threadList;

  Future<void> fetchUserThreadListData() async {
    try {
      final response = await userThreadListService.fetchData();
      final responseData = response['data'] as List<dynamic>;
      // print(responseData);
      final List<ThreadProfile> updatedData =
          responseData.map((data) => ThreadProfile.fromJson(data)).toList();

      _threadList = updatedData;
      notifyListeners();
    } catch (e) {
      print('Fetch user thread list data failed: $e');
    }
  }

  Future<void> refreshData() async {
    // Call the API again to fetch the updated data
    await fetchUserThreadListData();
  }
}

class UserReplyListController extends ChangeNotifier {
  final UserReplyListService userReplyListService;

  UserReplyListController({
    required this.userReplyListService,
  });

  List<ReplyProfile> _replyList = [];

  List<ReplyProfile> get replyList => _replyList;

  Future<void> fetchUserReplyListData() async {
    try {
      final response = await userReplyListService.fetchData();
      final responseData = response['data'] as List<dynamic>;
      // print(responseData);
      final List<ReplyProfile> updatedData =
          responseData.map((data) => (ReplyProfile.fromJson(data))).toList();

      _replyList = updatedData;
      notifyListeners();
    } catch (e) {
      print('Fetch user reply list data failed: $e');
    }
  }

  Future<void> refreshData() async {
    // Call the API again to fetch the updated data
    await fetchUserReplyListData();
  }
}
