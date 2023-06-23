import 'dart:convert';
import 'package:flutter/material.dart';

class CreateThreadForm extends StatefulWidget {
  const CreateThreadForm({Key? key}) : super(key: key);

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

  void _postThread() {
    String title = _titleController.text;
    String content = _contentController.text;

    // Create a JSON object
    Map<String, dynamic> threadData = {
      'title': title,
      'content': content,
    };

    String json = jsonEncode(threadData);
    print(json); // Replace with your desired logic for handling the JSON data
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add cancel logic here
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    backgroundColor: Colors.red,
                  ),
                ),
                ElevatedButton(
                  onPressed: _postThread,
                  child: Text('Post'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
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
