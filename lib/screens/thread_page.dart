import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/reply_detail_card.dart';
import 'package:talk_parmad/widgets/reply_form_input.dart';
import 'package:talk_parmad/widgets/thread_detail_card.dart';

class ThreadPage extends StatelessWidget {
  final Map<String, dynamic> threadData = {
    'threadTitle': 'What is Lorem Ipsum?',
    'threadText':
        'I need help with my homework. I need to know what is Lorem Ipsum?',
    'creatorData': {
      "userName": "John Doe",
      "userImage":
          "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
      "year": "2020",
      "major": "Computer Science",
      "isActive": true,
    },
    'forumData': {
      "forumName": "Informatics Forum",
    },
    'replyData': [
      {
        "userName": "John Doe",
        "userImage":
            "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
        "replyText":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum has been the industry standard dummy text ever since the 1500s",
        "numberOfUpvotes": 2,
        "numberOfDownvotes": 1,
      },
      {
        "userName": "Jane Doe",
        "userImage":
            "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
        "replyText":
            "I don't know what Lorem Ipsum is either. I'm also looking for help.",
        "numberOfUpvotes": 2,
        "numberOfDownvotes": 1,
      },
      {
        "userName": "Jane Doe",
        "userImage":
            "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
        "replyText": "Lorem ipsum dolor?",
        "numberOfUpvotes": 0,
        "numberOfDownvotes": 10,
      },
      {
        "userName": "Jane Doe",
        "userImage":
            "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
        "replyText":
            "You dont know what Lorem Ipsum is? It's a dummy text used in the printing and typesetting industry. It's been used since the 1500s",
        "numberOfUpvotes": 2,
        "numberOfDownvotes": 1,
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${threadData['forumData']['forumName']}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ThreadDetailCard(
          threadTitle: threadData['threadTitle'],
          threadText: threadData['threadText'],
          creatorData: threadData['creatorData'],
        ),
        // SizedBox(
        //     height: 16.0), // Add spacing between the detail card and replies
        Expanded(
          child: ListView.builder(
            itemCount: threadData['replyData'].length,
            itemBuilder: (BuildContext context, int index) {
              final reply = threadData['replyData'][index];
              return ReplyDetailCard(
                userName: reply['userName'],
                userImage: reply['userImage'],
                replyText: reply['replyText'],
                numberOfUpvotes: reply['numberOfUpvotes'],
                numberOfDownvotes: reply['numberOfDownvotes'],
              );
            },
          ),
        ),
        // SizedBox(height: 16.0),
        ReplyFormInput(),
      ],
    );
  }
}
