import 'package:flutter/material.dart';
import 'package:talk_parmad/widgets/forum_list_card.dart';

class ForumListPage extends StatelessWidget {
  final List<ForumData> forums = [
    ForumData(name: 'Forum 1', icon: Icons.forum),
    ForumData(name: 'Forum 2', icon: Icons.forum),
    ForumData(name: 'Forum 3', icon: Icons.forum),
    ForumData(name: 'Forum 4', icon: Icons.forum),
    ForumData(name: 'Forum 5', icon: Icons.forum),
    ForumData(name: 'Forum 6', icon: Icons.forum),
    ForumData(name: 'Forum 7', icon: Icons.forum),
    // Add more forum data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Forums',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ForumListCard(forums: forums),
          ),
        ],
      ),
    );
  }
}
