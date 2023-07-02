import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_parmad/controllers/forum_detail_controller.dart';
import 'package:talk_parmad/services/forum_detail_service.dart';
import 'package:talk_parmad/widgets/forum_card.dart';
import 'package:talk_parmad/widgets/forum_thread_card.dart';
import 'package:talk_parmad/widgets/sort_button.dart';

class ForumPage extends StatefulWidget {
  final int forumId;

  const ForumPage({Key? key, required this.forumId}) : super(key: key);

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  late ForumDetailController forumDetailController;

  @override
  void initState() {
    super.initState();
    forumDetailController = ForumDetailController(
      forumDetailService:
          ForumDetailService(baseUrl: 'http://localhost:8080/api/v1'),
    );
    forumDetailController.getForumDetail(widget.forumId);
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => forumDetailController,
      child: Consumer<ForumDetailController>(
        builder: (context, forumDetailController, _) {
          final forum = forumDetailController.forumDetail;

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
                    forumImage: forum.forum.forumImage,
                    forumName: forum.forum.forumName,
                    forumIntroText: forum.forum.introductionText,
                    forumTotalMembers: forum.numberOfMembers.toString(),
                    onJoinClicked: () {
                      forumDetailController.joinForum(forum.forum.id);
                    },
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
                            color:
                                Color(0xFF70A6F5), // Set the background color
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
                  forum.thread.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Center(
                            child: Text(
                              "No threads",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: forum.thread.length,
                          itemBuilder: (BuildContext context, int index) {
                            final threadItem = forum.thread[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ForumThreadCard(
                                userName: threadItem.createdBy.toString(),
                                userImage:
                                    '', // Pass the appropriate user image URL here
                                threadTitle: threadItem.title,
                                threadId: threadItem.id,
                              ),
                            );
                          },
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
