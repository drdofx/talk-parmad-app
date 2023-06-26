import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:talk_parmad/controllers/create_controller.dart';

class CreateForumForm extends StatefulWidget {
  final CreateForumController createForumController; // Add this line

  const CreateForumForm({
    Key? key,
    required this.createForumController, // Add this line
  }) : super(key: key);

  @override
  _CreateForumFormState createState() => _CreateForumFormState();
}

class _CreateForumFormState extends State<CreateForumForm> {
  String _selectedFileName = '';

  TextEditingController _forumNameController = TextEditingController();
  TextEditingController _forumDescriptionController = TextEditingController();

  void _selectImage() async {
    // Add your image selection logic here
    // Example using image_picker package:
    // File? pickedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    // if (pickedImage != null) {
    //   setState(() {
    //     _selectedFileName = pickedImage.path;
    //   });
    // }
  }

  void navigateToForumPage(int forumId) {
    Navigator.pushNamed(context, '/forum', arguments: {
      'forumId': forumId,
    });
  }

  void _createForum() async {
    final forumName = _forumNameController.text;
    final forumDescription = _forumDescriptionController.text;
    final forumCategory = 'category'; // Replace with the desired category value

    // Create a JSON object with the desired field names
    final forumData = {
      'forum_name': forumName,
      'introduction_text': forumDescription,
      'category': forumCategory,
    };

    print(forumData);

    var created = await widget.createForumController.createForum(forumData);

    print(created);

    if (created.isNotEmpty) {
      // Navigate to the forum list page
      navigateToForumPage(created['id']);
    } else {
      // Display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to create forum'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Forum Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
              controller: _forumNameController,
              onChanged: (value) {
                // Update the respective variable or perform additional logic
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Forum Category',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
              value: 'Academics',
              items: <String>['Academics', 'Non-Academics'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                // Update the respective variable or perform additional logic
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Forum Description',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
              maxLines: 3,
              controller: _forumDescriptionController,
              onChanged: (value) {
                // Update the respective variable or perform additional logic
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Upload Forum Image...',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller: TextEditingController(text: _selectedFileName),
                    enabled: false,
                  ),
                ),
                SizedBox(width: 8.0),
                // Remove the upload button if not needed
                // ElevatedButton(
                //   onPressed: _selectImage,
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.white,
                //     shape: CircleBorder(),
                //     padding: EdgeInsets.all(4.0),
                //   ),
                //   child: Icon(
                //     Icons.upload_file,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _createForum, // Call the _createForum method
                  child: Text('Create'),
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
