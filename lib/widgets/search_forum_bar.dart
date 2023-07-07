import 'package:flutter/material.dart';
import 'package:talk_parmad/controllers/search_controller.dart';

class SearchForumBar extends StatefulWidget {
  final SearchForumController searchForumController;

  const SearchForumBar({
    Key? key,
    required this.searchForumController,
  }) : super(key: key);

  @override
  _SearchForumBarState createState() => _SearchForumBarState();
}

class _SearchForumBarState extends State<SearchForumBar> {
  TextEditingController _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  void _handleSubmit(String value) {
    Navigator.pushNamed(context, '/searchForum', arguments: {
      'forum_name': value,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: Colors.white, // Set the background color to white
          child: TextField(
            controller: _searchTextController,
            style:
                TextStyle(color: Colors.black), // Set the text color to black
            decoration: InputDecoration(
              hintText: 'Search forums...',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ), // Set the icon color to black
              border: InputBorder.none, // Remove the border
              contentPadding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0), // Add padding to the content
            ),
            onSubmitted: _handleSubmit,
          ),
        ),
      ),
    );
  }
}
