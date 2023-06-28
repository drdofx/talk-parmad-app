import 'package:flutter/material.dart';
import 'package:talk_parmad/controllers/search_controller.dart';
import 'package:talk_parmad/models/forum_list.dart';
import 'package:talk_parmad/widgets/discover_forum_list.dart';
import 'package:talk_parmad/widgets/search_forum_bar.dart';
import 'package:talk_parmad/widgets/discover_forum_carousel.dart';

class ForumDiscoveryPage extends StatelessWidget {
  final SearchForumController searchForumController;

  ForumDiscoveryPage({
    Key? key,
    required this.searchForumController,
  }) : super(key: key);

  final List<ForumData> forums = [
    ForumData(
      forumId: 1,
      forumName: 'Forum 1',
      forumImage:
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      forumIntroductionText: "ok",
      forumCategory: "academics",
    ),
    ForumData(
      forumId: 1,
      forumName: 'Forum 2',
      forumImage:
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      forumIntroductionText: "ok",
      forumCategory: "academics",
    ),
    ForumData(
      forumId: 1,
      forumName: 'Forum 3',
      forumImage:
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      forumIntroductionText: "ok",
      forumCategory: "academics",
    ),
    ForumData(
      forumId: 1,
      forumName: 'Forum 4',
      forumImage:
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      forumIntroductionText: "ok",
      forumCategory: "academics",
    ),
    ForumData(
      forumId: 1,
      forumName: 'Forum 5',
      forumImage:
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      forumIntroductionText: "ok",
      forumCategory: "academics",
    ),
    ForumData(
      forumId: 1,
      forumName: 'Forum 6',
      forumImage:
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      forumIntroductionText: "ok",
      forumCategory: "academics",
    ),
    ForumData(
      forumId: 1,
      forumName: 'Forum 7',
      forumImage:
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      forumIntroductionText: "ok",
      forumCategory: "academics",
    ),
    // Add more forum data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: SearchForumBar(
              searchForumController: searchForumController,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child:
                DiscoverForumCarousel(), // Add the DiscoverForumCarousel widget here
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: DiscoverForumList(forums: forums),
          ),
        ],
      ),
    );
  }
}
