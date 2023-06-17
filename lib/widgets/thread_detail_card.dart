import 'package:flutter/material.dart';

class ThreadDetailCard extends StatelessWidget {
  final String threadTitle;
  final String threadText;
  final Map<String, dynamic> creatorData;
  final int numberOfReplies;
  final int numberOfUpvotes;
  final int numberOfDownvotes;

  ThreadDetailCard({
    required this.threadTitle,
    required this.threadText,
    required this.creatorData,
    this.numberOfReplies = 0,
    this.numberOfUpvotes = 0,
    this.numberOfDownvotes = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(creatorData["userImage"]),
                          radius: 42.0,
                        ),
                        SizedBox(width: 4.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                creatorData["userName"],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                '${creatorData["major"]} - ${creatorData["year"]}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '${creatorData["isActive"] ? "Active Student" : "Inactive Student"}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    threadTitle,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    threadText,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$numberOfReplies Comments',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up,
                        size: 24.0,
                        color: Colors.green,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '$numberOfUpvotes',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Icon(
                        Icons.thumb_down,
                        size: 24.0,
                        color: Colors.red,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '$numberOfDownvotes',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Divider(height: 1.0, color: Colors.grey), // Add a horizontal line
            ],
          ),
        ),
      ],
    );
  }
}
