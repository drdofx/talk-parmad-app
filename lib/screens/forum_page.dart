import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/forum_card.dart';
import 'package:talk_parmad/widgets/forum_thread_card.dart';
import 'package:talk_parmad/widgets/sort_button.dart';

class ForumPage extends StatelessWidget {
  final int? forumId;

  ForumPage({super.key, required this.forumId});

  final Map<String, dynamic> forumData = {
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
        "threadId": 1,
        "threadTitle": "Lorem ipsum dolor sit amet",
      },
      {
        "userName": "Jane Smith",
        "userImage":
            "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
        "threadId": 1,
        "threadTitle": "Ipsa quae ab illo inventore veritatis",
      },
      {
        "userName": "Jane Smith",
        "userImage":
            "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
        "threadId": 1,
        "threadTitle": "Ipsa quae ab illo inventore veritatis",
      },
      {
        "userName": "Jane Smith",
        "userImage":
            "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
        "threadId": 1,
        "threadTitle": "Ipsa quae ab illo inventore veritatis",
      },
      {
        "userName": "Jane Smith",
        "userImage":
            "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
        "threadId": 1,
        "threadTitle": "Ipsa quae ab illo inventore veritatis",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCBE0FF),
        title: const Text(
          'Talk Parmad',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForumCard(
              forumImage: forumData['forumImage'],
              forumName: forumData['forumName'],
              forumIntroText: forumData['forumIntroText'],
              forumTotalMembers: forumData['forumTotalMembers'],
              threadData: forumData['threadData'],
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: SortButton(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF70A6F5), // Set the background color
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Redirect to create thread
                        Navigator.pushNamed(context, '/create_thread');
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white, // Set the icon color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: forumData['threadData'].length,
              itemBuilder: (BuildContext context, int index) {
                final threadItem = forumData['threadData'][index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ForumThreadCard(
                    userName: threadItem['userName'],
                    userImage: threadItem['userImage'],
                    threadTitle: threadItem['threadTitle'],
                    threadId: threadItem['threadId'],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
