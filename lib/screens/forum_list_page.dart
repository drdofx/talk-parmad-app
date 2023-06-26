import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_parmad/controllers/forum_list_controller.dart';
import 'package:talk_parmad/models/forum_list.dart';
import 'package:talk_parmad/widgets/forum_list_card.dart';

class ForumListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForumListController>(
      builder: (context, forumListController, _) {
        final List<ForumData> forums = forumListController.forumList;

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Forums',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 16.0),
                child: ForumListCard(forums: forums),
              ),
            ],
          ),
        );
      },
    );
  }
}
