import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/thread.dart';
import 'package:talk_parmad/services/thread_detail_service.dart';

class ThreadDetailController extends ChangeNotifier {
  final ThreadDetailService threadDetailService;

  ThreadDetailController({
    required this.threadDetailService,
  });

  ThreadDetail _threadDetail = ThreadDetail();

  ThreadDetail get threadDetail => _threadDetail;

  Future<void> getThreadDetail(int threadId) async {
    try {
      final response = await threadDetailService.getThreadDetail(threadId);
      final responseData = response['data'] as Map<String, dynamic>;

      final updatedData = ThreadDetail.fromJson(responseData);

      _threadDetail = updatedData;
      notifyListeners();
    } catch (e) {
      print('Fetch thread detail data failed: $e');
    }
  }

  Future<void> refreshData(int threadId) async {
    // Call the API again to fetch the updated data
    await getThreadDetail(threadId);
  }

  // Vote thread
  Future<void> voteThread(int threadId, bool vote) async {
    try {
      await threadDetailService.voteThread({
        "thread_id": threadId.toString(),
        "vote": vote,
      });
      await getThreadDetail(threadId);
    } catch (e) {
      print('Vote thread failed: $e');
    }
  }

  // Create reply
  Future<bool> createReply(int threadId, String replyText) async {
    try {
      await threadDetailService.createReply({
        "thread_id": threadId.toString(),
        "text": replyText,
      });
      await getThreadDetail(threadId);

      return true;
    } catch (e) {
      print('Create reply failed: $e');
      return false;
    }
  }

  // Vote reply
  Future<void> voteReply(int threadId, int replyId, bool vote) async {
    try {
      await threadDetailService.voteReply({
        "reply_id": replyId.toString(),
        "vote": vote,
      });
      await getThreadDetail(threadId);
    } catch (e) {
      print('Vote reply failed: $e');
    }
  }
}
