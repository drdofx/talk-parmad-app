import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/create_thread_form.dart';
import 'package:talk_parmad/widgets/forum_card.dart';

class CreateThreadPage extends StatelessWidget {
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
    // Add more forum data here
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ForumCard(
            forumImage: forumData['forumImage'],
            forumName: forumData['forumName'],
            forumIntroText: forumData['forumIntroText'],
            forumTotalMembers: forumData['forumTotalMembers'],
            threadData: forumData['threadData'],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text(
              'Create a new thread!',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CreateThreadForm(),
          ),
        ],
      ),
    );
  }
}
