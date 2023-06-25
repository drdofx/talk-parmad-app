import 'package:flutter/material.dart';
import 'package:talk_parmad/controllers/auth_controller.dart';
import 'package:talk_parmad/models/reply_profile.dart';
import 'package:talk_parmad/widgets/profile_card.dart';
import 'package:talk_parmad/widgets/profile_thread_card.dart';
import 'package:talk_parmad/widgets/reply_card.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ProfilePage();
//   }
// }

class ProfilePage extends StatefulWidget {
  final AuthController authController;

  const ProfilePage({Key? key, required this.authController}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Map<String, dynamic>> apiResponse = [
    {
      "user_id": 1,
      "forum_id": 1,
      "forum_name": "Informatics",
      "forum_image":
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      "thread_id": 5,
      "title": "Saya butuh bantuan untuk membuat kalkulator di C++",
      "text": "lorem ipsum lorem ipsum"
    },
    {
      "user_id": 1,
      "forum_id": 2,
      "forum_name": "Game Dev",
      "forum_image": "",
      "thread_id": 4,
      "title": "Demonstrasi Capsule Collider dan Mesh Collider",
      "text": "lorem ipsum lorem ipsum"
    },
    {
      "user_id": 1,
      "forum_id": 1,
      "forum_name": "Informatics",
      "forum_image": "",
      "thread_id": 5,
      "title": "Cara menginstall Python di MacOS",
      "text": "lorem ipsum lorem ipsum"
    },
    // Add more API response items here
  ];

  final List<Map<String, dynamic>> apiThreadReplyResponse = [
    {
      "user_id": 1,
      "forum_id": 1,
      "forum_name": "Informatics",
      "forum_image":
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      "thread_title": "Saya butuh bantuan untuk membuat kalkulator di C++",
      "reply_text":
          "Anda bisa menggunakan library math.h dan cmath. Tools ini sudah tersedia di C++",
    },
    {
      "user_id": 1,
      "forum_id": 1,
      "forum_name": "Informatics",
      "forum_image":
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      "thread_title": "Bagaimana cara menginstall Python di MacOS",
      "reply_text":
          "Carilah di google dengan keyword 'how to install python on macos'"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ThreadProfile> profileThreadData = apiResponse.map((data) {
      return ThreadProfile.fromJson(data);
    }).toList();

    List<ReplyProfile> profileThreadReplyData =
        apiThreadReplyResponse.map((data) {
      return ReplyProfile.fromJson(data);
    }).toList();

    return Column(
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
              // call logout() from auth controller
              widget.authController.logout();
            },
            onEditProfilePressed: () {
              // Handle edit profile button press
            },
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
              ListView.builder(
                itemCount: profileThreadData.length,
                itemBuilder: (BuildContext context, int index) {
                  final profileThreadItem = profileThreadData[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0), // Add bottom margin
                    child: ProfileThreadCard(
                      threadData: profileThreadItem,
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: profileThreadReplyData.length,
                itemBuilder: (BuildContext context, int index) {
                  final profileThreadItem = profileThreadReplyData[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0), // Add bottom margin
                    child: ReplyCard(
                      replyProfileData: profileThreadItem,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
