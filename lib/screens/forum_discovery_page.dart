import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_parmad/controllers/forum_discovery_controller.dart';
import 'package:talk_parmad/controllers/search_controller.dart';
import 'package:talk_parmad/models/forum_list.dart';
import 'package:talk_parmad/widgets/discover_forum_list.dart';
import 'package:talk_parmad/widgets/search_forum_bar.dart';
import 'package:talk_parmad/widgets/discover_forum_carousel.dart';

class ForumDiscoveryPage extends StatelessWidget {
  final SearchForumController searchForumController;

  const ForumDiscoveryPage({
    Key? key,
    required this.searchForumController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ForumDiscoveryController>(
      builder: (context, forumDiscoveryController, _) {
        final List<ForumData> forums = forumDiscoveryController.forumList;

        return RefreshIndicator(
          onRefresh: forumDiscoveryController.refreshData,
          child: _buildForumDiscoveryPage(forums),
        );
      },
    );
  }

  Widget _buildForumDiscoveryPage(List<ForumData> forums) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: SearchForumBar(
              searchForumController: searchForumController,
            ),
          ),
          if (forums.isEmpty)
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 8.0, right: 8.0, bottom: 16.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'No more forums to discover!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          if (forums.isNotEmpty)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 16.0),
                  child: DiscoverForumCarousel(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 16.0),
                  child: DiscoverForumList(forums: forums),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
