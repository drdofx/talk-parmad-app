import 'package:flutter/foundation.dart';
import 'package:talk_parmad/services/forum_detail_service.dart';

class ForumDetailController extends ChangeNotifier {
  final ForumDetailService forumDetailService;

  ForumDetailController({
    required this.forumDetailService,
  });

  Future<Map<String, dynamic>> searchForums(Map<String, dynamic> data) async {
    try {
      final response = await forumDetailService.getForumDetail(data);
      final responseData = response['data'] as Map<String, dynamic>;

      print(responseData);

      notifyListeners();

      return responseData;
    } catch (e) {
      print('Create forum failed: $e');
      return {};
    }
  }
}
