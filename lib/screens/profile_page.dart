import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_parmad/controllers/auth_controller.dart';
import 'package:talk_parmad/controllers/profile_controller.dart';
import 'package:talk_parmad/models/reply_profile.dart';
import 'package:talk_parmad/widgets/profile_card.dart';
import 'package:talk_parmad/widgets/profile_thread_card.dart';
import 'package:talk_parmad/widgets/reply_card.dart';

class ProfilePage extends StatefulWidget {
  final AuthController authController;
  final UserThreadListController userThreadListController;
  final UserReplyListController userReplyListController;

  const ProfilePage({
    Key? key,
    required this.authController,
    required this.userThreadListController,
    required this.userReplyListController,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(_handleTabChange);
    // _fetchData();
  }

  @override
  void dispose() {
    _tabController!.removeListener(_handleTabChange);
    _tabController!.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController!.indexIsChanging) {
      _fetchData();
    }
  }

  void _fetchData() {
    if (_tabController!.index == 0) {
      widget.userThreadListController.fetchUserThreadListData();
    } else if (_tabController!.index == 1) {
      widget.userReplyListController.fetchUserReplyListData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserThreadListController, UserReplyListController>(
      builder: (context, userThreadListController, userReplyListController, _) {
        return RefreshIndicator(
          onRefresh: () async {
            await userThreadListController.fetchUserThreadListData();
            await userReplyListController.fetchUserReplyListData();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ProfileCard(
                  imageUrl:
                      'https://static.vecteezy.com/system/resources/previews/007/901/920/non_2x/man-with-a-beard-and-glasses-porter-character-for-the-avatar-trendy-style-illustration-for-icon-avatars-portrait-design-vector.jpg',
                  name: 'John Doe',
                  major: 'Computer Science',
                  year: '2020',
                  isActive: true,
                  onLogoutPressed: () {
                    widget.authController.logout();
                  },
                  onEditProfilePressed: () {
                    // Handle edit profile button press
                  },
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: const [
                    Tab(text: 'Threads'),
                    Tab(text: 'Replies'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RefreshIndicator(
                      onRefresh:
                          userThreadListController.fetchUserThreadListData,
                      child: ListView.builder(
                        itemCount: userThreadListController.threadList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final profileThreadItem =
                              userThreadListController.threadList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ProfileThreadCard(
                              threadData: profileThreadItem,
                            ),
                          );
                        },
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: userReplyListController.fetchUserReplyListData,
                      child: ListView.builder(
                        itemCount: userReplyListController.replyList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final profileThreadItem =
                              userReplyListController.replyList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ReplyCard(
                              replyProfileData: profileThreadItem,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
