import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/forum.dart';
import 'package:talk_parmad/services/forum_detail_service.dart';

class ForumDetailController extends ChangeNotifier {
  final ForumDetailService forumDetailService;

  ForumDetailController({
    required this.forumDetailService,
  });

  ForumDetail _forumDetail = ForumDetail();

  ForumDetail get forumDetail => _forumDetail;

  Future<void> getForumDetail(int forumId) async {
    try {
      final response = await forumDetailService.getForumDetail(forumId);
      final responseData = response['data'] as Map<String, dynamic>;

      final updatedData = ForumDetail.fromJson(responseData);

      _forumDetail = updatedData;
      notifyListeners();
    } catch (e) {
      print('Fetch forum detail data failed: $e');
    }
  }
}
