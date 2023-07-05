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
  int? thisThreadId;

  @override
  void initState() {
    super.initState();
    threadDetailController = ThreadDetailController(
      threadDetailService:
          ThreadDetailService(baseUrl: 'http://localhost:8080/api/v1'),
    );
    threadDetailController.getThreadDetail(widget.threadId);

    thisThreadId = widget.threadId;
  }

  final Map<String, dynamic> creatorData = {
    "userName": "John Doe",
    "userImage":
        "https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg",
    "year": "2020",
    "major": "Computer Science",
    "isActive": true,
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
            body: RefreshIndicator(
              onRefresh: () =>
                  threadDetailController.refreshData(thisThreadId!),
              child: Column(
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
                            creatorData: creatorData,
                            numberOfReplies: thread.totalReplies,
                            numberOfUpvotes: thread.totalUpvotes,
                            numberOfDownvotes: thread.totalDownvotes,
                            onUpvote: () {
                              threadDetailController.voteThread(
                                  thread.thread.id, true);
                            },
                            onDownvote: () {
                              threadDetailController.voteThread(
                                  thread.thread.id, false);
                            },
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
                                onUpvote: () {
                                  threadDetailController.voteReply(
                                      thread.thread.id, reply.id, true);
                                },
                                onDownvote: () {
                                  threadDetailController.voteReply(
                                      thread.thread.id, reply.id, false);
                                },
                              );
                            },
                          ),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                  ),
                  ReplyFormInput(
                    createReplyController: threadDetailController,
                    threadId: thread.thread.id,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
