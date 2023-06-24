import 'package:flutter/material.dart';
import 'package:talk_parmad/models/forum_list.dart';

class DiscoverForumList extends StatelessWidget {
  final List<ForumData> forums;

  const DiscoverForumList({super.key, required this.forums});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '...or discover these forums!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              children: [
                for (int i = 0; i < forums.length; i += 3)
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0,
                        left: 8.0,
                        right: 8.0), // Add bottom padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int j = i; j < i + 3 && j < forums.length; j++)
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/forum',
                                arguments: {
                                  'forumId': forums[j].forumId,
                                },
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 96.0, // Set desired width
                                  height: 96.0, // Set desired height
                                  child: Image.network(
                                    forums[j].forumImage,
                                    fit: BoxFit
                                        .cover, // Adjust the fit property as needed
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(forums[j].forumName),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
