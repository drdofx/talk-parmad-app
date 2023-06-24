import 'package:flutter/material.dart';
import 'package:talk_parmad/models/forum_list.dart';

class ForumListCard extends StatelessWidget {
  final List<ForumData> forums;

  const ForumListCard({Key? key, required this.forums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(height: 32.0),
        Text(
          'Last Viewed',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 16.0),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/forum',
                arguments: {
                  'forumId': 1, // Replace with the actual forum ID
                },
              );
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 72.0),
                    SizedBox(height: 16.0),
                    Text(
                      'Last Viewed Forum',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
