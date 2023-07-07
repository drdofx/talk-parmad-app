import 'package:flutter/material.dart';
import 'package:talk_parmad/controllers/thread_detail_controller.dart';

class ReplyFormInput extends StatefulWidget {
  final ThreadDetailController createReplyController;
  final int threadId;

  const ReplyFormInput({
    Key? key,
    required this.createReplyController,
    required this.threadId,
  }) : super(key: key);

  @override
  _ReplyFormInputState createState() => _ReplyFormInputState();
}

class _ReplyFormInputState extends State<ReplyFormInput> {
  TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  void _postReply() async {
    final replyText = _replyController.text;

    // Create a JSON object
    final replyData = {
      'text': replyText,
      'thread_id': widget.threadId,
    };

    print(replyData);

    var created = await widget.createReplyController
        .createReply(widget.threadId, replyText);

    print(created);

    // Show an error message
    if (!created) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create reply'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Clear the text field
      _replyController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero, // Remove the default margin
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
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
                onPressed: _postReply,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4.0),
                ),
                child: Icon(
                  Icons.send,
                  color: Color(0xFF70A6F5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
