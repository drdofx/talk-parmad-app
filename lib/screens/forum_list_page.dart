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

        return RefreshIndicator(
          onRefresh: forumListController.refreshData,
          child: SingleChildScrollView(
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
                forums.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 8.0, right: 8.0, bottom: 16.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'You have not joined any forums yet!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 16.0),
                        child: ForumListCard(forums: forums),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
