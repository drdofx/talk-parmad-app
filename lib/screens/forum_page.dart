import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/forum_card.dart';
import 'package:talk_parmad/widgets/forum_thread_card.dart';
import 'package:talk_parmad/widgets/sort_button.dart';

class ForumPage extends StatelessWidget {
  final List<Map<String, dynamic>> forumData = [
    {
      'forumImage':
          'https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg',
      'forumName': 'Forum 1',
      'forumIntroText':
          'Join the discussion, lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      'forumTotalMembers': '100',
      'threadData': [
        {
          "userName": "John Doe",
          "userImage":
              "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
          "threadTitle": "Lorem ipsum dolor sit amet",
        },
        {
          "userName": "Jane Smith",
          "userImage":
              "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
          "threadTitle": "Ipsa quae ab illo inventore veritatis",
        },
        {
          "userName": "Jane Smith",
          "userImage":
              "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
          "threadTitle": "Ipsa quae ab illo inventore veritatis",
        },
        {
          "userName": "Jane Smith",
          "userImage":
              "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
          "threadTitle": "Ipsa quae ab illo inventore veritatis",
        },
        {
          "userName": "Jane Smith",
          "userImage":
              "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
          "threadTitle": "Ipsa quae ab illo inventore veritatis",
        },
      ],
    },
    // Add more forum data here
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: forumData.length,
            itemBuilder: (BuildContext context, int index) {
              final forumItem = forumData[index];
              return Column(
                children: [
                  ForumCard(
                    forumImage: forumItem['forumImage'],
                    forumName: forumItem['forumName'],
                    forumIntroText: forumItem['forumIntroText'],
                    forumTotalMembers: forumItem['forumTotalMembers'],
                    threadData: forumItem['threadData'],
                  ),
                  SizedBox(height: 16.0),
                  SortButton(),
                  SizedBox(height: 16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: forumItem['threadData'].length,
                    itemBuilder: (BuildContext context, int index) {
                      final threadItem = forumItem['threadData'][index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ForumThreadCard(
                          userName: threadItem['userName'],
                          userImage: threadItem['userImage'],
                          threadTitle: threadItem['threadTitle'],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
