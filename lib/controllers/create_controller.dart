import 'package:flutter/foundation.dart';
import 'package:talk_parmad/services/create_service.dart';

class CreateForumController extends ChangeNotifier {
  final CreateForumService createForumService;

  CreateForumController({
    required this.createForumService,
  });

  Future<Map<String, dynamic>> createForum(Map<String, dynamic> data) async {
    try {
      final response = await createForumService.createForum(data);
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

// class CreateThreadController extends ChangeNotifier {
//   final CreateThreadService createThreadService;

//   CreateThreadController({
//     required this.createThreadService,
//   });

//   Future<Map<String, dynamic>> createThread(Map<String, dynamic> data) async {
//     try {
//       final response = await createThreadService.createThread(data);
//       final responseData = response['data'] as Map<String, dynamic>;

//       print(responseData);

//       notifyListeners();

//       return responseData;
//     } catch (e) {
//       print('Create thread failed: $e');
//       return {};
//     }
//   }
// }

class CreateReplyController extends ChangeNotifier {
  final CreateReplyService createReplyService;

  CreateReplyController({
    required this.createReplyService,
  });

  Future<Map<String, dynamic>> createReply(Map<String, dynamic> data) async {
    try {
      final response = await createReplyService.createReply(data);
      final responseData = response['data'] as Map<String, dynamic>;

      print(responseData);

      notifyListeners();

      return responseData;
    } catch (e) {
      print('Create reply failed: $e');
      return {};
    }
  }
}
