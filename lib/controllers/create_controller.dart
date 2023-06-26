import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/forum_list.dart';
import 'package:talk_parmad/services/create_service.dart';
import 'package:talk_parmad/services/forum_list_service.dart';

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
