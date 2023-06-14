import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/forum_list_card.dart';

class ForumListPage extends StatelessWidget {
  final List<ForumData> forums = [
    ForumData(
        forumName: 'Forum 1',
        forumImage:
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg"),
    ForumData(
        forumName: 'Forum 2',
        forumImage:
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg"),
    ForumData(
        forumName: 'Forum 3',
        forumImage:
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg"),
    ForumData(
        forumName: 'Forum 4',
        forumImage:
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg"),
    ForumData(
        forumName: 'Forum 5',
        forumImage:
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg"),
    ForumData(
        forumName: 'Forum 6',
        forumImage:
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg"),
    ForumData(
        forumName: 'Forum 7',
        forumImage:
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg"),
    // Add more forum data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: ForumListCard(forums: forums),
          ),
        ],
      ),
    );
  }
}
