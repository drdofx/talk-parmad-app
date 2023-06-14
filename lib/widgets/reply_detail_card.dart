import 'package:flutter/material.dart';

class ReplyDetailCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String replyText;

  ReplyDetailCard({
    required this.userName,
    required this.userImage,
    required this.replyText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userImage),
                    radius: 24.0,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Flexible(
            flex: 3,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  replyText,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
