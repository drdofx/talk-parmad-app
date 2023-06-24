import 'package:flutter/material.dart';

class ForumThreadCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String threadTitle;
  final int threadId;

  ForumThreadCard({
    required this.userName,
    required this.userImage,
    required this.threadTitle,
    required this.threadId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/thread',
              arguments: {
                'threadId': threadId, // Replace with the actual thread ID
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
                          child: userImage != ""
                              ? Image.network(
                                  userImage,
                                  fit: BoxFit.cover,
                                )
                              : Icon(Icons.person, size: 80.0),
                        ),
                        SizedBox(height: 8.0), // Add padding here
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              userName,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100.0,
                      child: Center(
                        child: Text(
                          threadTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
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
          )),
    );
  }
}
