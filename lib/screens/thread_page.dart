import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_parmad/controllers/thread_detail_controller.dart';
import 'package:talk_parmad/services/thread_detail_service.dart';
import 'package:talk_parmad/widgets/reply_detail_card.dart';
import 'package:talk_parmad/widgets/reply_form_input.dart';
import 'package:talk_parmad/widgets/thread_detail_card.dart';

class ThreadPage extends StatefulWidget {
  final int threadId;

  const ThreadPage({Key? key, required this.threadId}) : super(key: key);

  @override
  _ThreadPageState createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  late ThreadDetailController threadDetailController;

  @override
  void initState() {
    super.initState();
    threadDetailController = ThreadDetailController(
      threadDetailService:
          ThreadDetailService(baseUrl: 'http://localhost:8080/api/v1'),
    );
    threadDetailController.getThreadDetail(widget.threadId);
  }

  final Map<String, dynamic> threadData = {
    'threadId': 1,
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
    return ChangeNotifierProvider(
      create: (context) => threadDetailController,
      child: Consumer<ThreadDetailController>(
        builder: (context, threadDetailController, _) {
          final thread = threadDetailController.threadDetail;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFCBE0FF),
              title: const Text(
                'Talk Parmad',
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0.0,
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16, top: 8, bottom: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Informatics Forum",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ThreadDetailCard(
                          threadTitle: thread.thread.title,
                          threadText: thread.thread.text,
                          creatorData: threadData['creatorData'],
                          numberOfReplies: thread.totalReplies,
                          numberOfUpvotes: thread.totalUpvotes,
                          numberOfDownvotes: thread.totalDownvotes,
                        ),
                        SizedBox(height: 16.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: thread.replies.length,
                          itemBuilder: (BuildContext context, int index) {
                            final reply = thread.replies[index];
                            return ReplyDetailCard(
                              userName: reply.createdBy,
                              userImage: "https://picsum.photos/200/300",
                              replyText: reply.text,
                              numberOfUpvotes: reply.totalUpvotes,
                              numberOfDownvotes: reply.totalDownvotes,
                            );
                          },
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
                ReplyFormInput(),
              ],
            ),
          );
        },
      ),
    );
  }
}
