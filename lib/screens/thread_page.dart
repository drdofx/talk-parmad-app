import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/reply_detail_card.dart';
import 'package:talk_parmad/widgets/thread_detail_card.dart';

class ThreadPage extends StatelessWidget {
  final Map<String, dynamic> threadData = {
    'threadTitle': 'What is Lorem Ipsum?',
    'threadText':
        'I need help with my homework. I need to know what is Lorem Ipsum?',
    'creatorData': [
      {
        "userName": "John Doe",
        "userImage":
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
        "year": "2020",
        "major": "Computer Science",
        "isActive": true,
      },
    ],
    'replyData': [
      {
        "userName": "John Doe",
        "userImage":
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
        "replyText":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum has been the industry standard dummy text ever since the 1500s",
      },
      {
        "userName": "Jane Doe",
        "userImage":
            "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
        "replyText":
            "I don't know what Lorem Ipsum is either. I'm also looking for help.",
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ThreadDetailCard(
          threadTitle: threadData['threadTitle'],
          threadText: threadData['threadText'],
          creatorData: threadData['creatorData'],
        ),
        SizedBox(
            height: 16.0), // Add spacing between the detail card and replies
        Expanded(
          child: ListView.builder(
            itemCount: threadData['replyData'].length,
            itemBuilder: (BuildContext context, int index) {
              final reply = threadData['replyData'][index];
              return ReplyDetailCard(
                userName: reply['userName'],
                userImage: reply['userImage'],
                replyText: reply['replyText'],
              );
            },
          ),
        ),
      ],
    );
  }
}
