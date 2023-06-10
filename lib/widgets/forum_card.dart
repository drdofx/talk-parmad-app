import 'package:flutter/material.dart';

class ForumCard extends StatelessWidget {
  final String forumImage;
  final String forumName;
  final String forumIntroText;
  final String forumTotalMembers;
  final List<Map<String, dynamic>> threadData;

  const ForumCard({
    Key? key,
    required this.forumImage,
    required this.forumName,
    required this.forumIntroText,
    required this.forumTotalMembers,
    required this.threadData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
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
                    Text(
                      forumName,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$forumTotalMembers Members',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: () {},
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
                    Text(
                      forumIntroText,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.justify,
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
