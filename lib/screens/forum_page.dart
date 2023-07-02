import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_parmad/controllers/forum_detail_controller.dart';
import 'package:talk_parmad/services/forum_detail_service.dart';
import 'package:talk_parmad/widgets/create_thread_form.dart';
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
  bool showCreateThreadForm = false;
  int? previousForumId;

  @override
  void initState() {
    super.initState();
    forumDetailController = ForumDetailController(
      forumDetailService:
          ForumDetailService(baseUrl: 'http://localhost:8080/api/v1'),
    );
    forumDetailController.getForumDetail(widget.forumId);

    previousForumId = widget.forumId;
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
            body: RefreshIndicator(
              onRefresh: () =>
                  forumDetailController.refreshData(previousForumId!),
              child: SingleChildScrollView(
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
                      isMember: forum.isMember,
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 28.0),
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
                                setState(() {
                                  showCreateThreadForm = !showCreateThreadForm;
                                });
                              },
                              icon: Icon(
                                showCreateThreadForm
                                    ? Icons.close
                                    : Icons
                                        .add, // Set the add icon if the form is not visible, else set the close icon
                                color: Colors.white, // Set the icon color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    if (showCreateThreadForm)
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 16.0, top: 8.0),
                            child: Text(
                              'Create a new thread!',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: CreateThreadForm(),
                          ),
                        ],
                      ),
                    if (!showCreateThreadForm && forum.thread.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Center(
                          child: Text(
                            "No threads",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    if (!showCreateThreadForm && forum.thread.isNotEmpty)
                      ListView.builder(
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
            ),
          );
        },
      ),
    );
  }
}
