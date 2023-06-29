import 'package:flutter/material.dart';
import 'package:talk_parmad/models/thread_profile.dart';

class ProfileThreadCard extends StatelessWidget {
  final ThreadProfile threadData;

  ProfileThreadCard({required this.threadData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 12.0), // Add left and right padding
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/thread',
            arguments: {
              'threadId':
                  threadData.threadId, // Replace with the actual thread ID
            },
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80.0,
                        width: double.infinity,
                        child: threadData.forumImage != ""
                            ? Image.network(
                                threadData.forumImage,
                                fit: BoxFit.cover,
                              )
                            : Icon(Icons.image_not_supported),
                      ),
                      SizedBox(height: 2.0),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          threadData.forumName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100.0,
                    child: Center(
                      child: Text(
                        threadData.threadTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
