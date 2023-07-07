import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:talk_parmad/controllers/forum_detail_controller.dart';

class CreateThreadForm extends StatefulWidget {
  final ForumDetailController createThreadController;
  final int forumId;

  const CreateThreadForm({
    Key? key,
    required this.createThreadController,
    required this.forumId,
  }) : super(key: key);

  @override
  _CreateThreadFormState createState() => _CreateThreadFormState();
}

class _CreateThreadFormState extends State<CreateThreadForm> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void navigateToThreadPage(int threadId) {
    Navigator.pushNamed(context, '/thread', arguments: {
      'threadId': threadId,
    });
  }

  void _postThread() async {
    final title = _titleController.text;
    final content = _contentController.text;

    // Create a JSON object
    final threadData = {
      'title': title,
      'text': content,
      'forum_id': widget.forumId.toString(),
    };

    print(threadData);

    var created = await widget.createThreadController.createThread(threadData);

    print(created);

    if (created.isNotEmpty) {
      // Refresh the forum detail page
      widget.createThreadController.refreshData(widget.forumId);

      // Clear the text fields
      _titleController.clear();
      _contentController.clear();

      // Navigate to the created thread page
      navigateToThreadPage(created['id']);
    } else {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create thread'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
                alignLabelWithHint:
                    true, // Align label with the start of the hint text
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
              ),
              maxLines: 10,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _postThread,
                  child: Text('Post'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    backgroundColor: Color(0xFF70A6F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
