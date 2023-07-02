import 'package:flutter/material.dart';
import 'package:talk_parmad/models/forum.dart';

class ForumCard extends StatelessWidget {
  final String forumImage;
  final String forumName;
  final String forumIntroText;
  final String forumTotalMembers;
  final VoidCallback onJoinClicked;

  const ForumCard({
    Key? key,
    required this.forumImage,
    required this.forumName,
    required this.forumIntroText,
    required this.forumTotalMembers,
    required this.onJoinClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        forumImage,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        forumName,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '$forumTotalMembers Members',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.0), // Add some spacing between the columns
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      forumIntroText,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 8.0), // Add some spacing between the columns
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: onJoinClicked,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF70A6F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Join',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
