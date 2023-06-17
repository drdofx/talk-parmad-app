import 'package:flutter/material.dart';

class SearchForumBar extends StatelessWidget {
  const SearchForumBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: Colors.white, // Set the background color to white
          child: TextField(
            style:
                TextStyle(color: Colors.black), // Set the text color to black
            decoration: InputDecoration(
              hintText: 'Search forums.',
              prefixIcon: Icon(Icons.search,
                  color: Colors.black), // Set the icon color to black
              border: InputBorder.none, // Remove the border
              contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0), // Add padding to the content
            ),
            onSubmitted: (value) => print(value),
          ),
        ),
      ),
    );
  }
}
