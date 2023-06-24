import 'package:flutter/material.dart';

class ReplyFormInput extends StatefulWidget {
  @override
  _ReplyFormInputState createState() => _ReplyFormInputState();
}

class _ReplyFormInputState extends State<ReplyFormInput> {
  TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero, // Remove the default margin
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 4.0),
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: _replyController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: InputBorder.none, // Remove border lines
                    ),
                    maxLines: null, // Allow the text to wrap
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  String replyText = _replyController.text;
                  // Perform the necessary logic with the reply text
                  // For example, you can add it to a list of replies
                  // or send it to an API for further processing
                  print('Reply: $replyText');
                  _replyController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4.0),
                ),
                child: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
