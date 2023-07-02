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
}
