import 'package:flutter/material.dart';

class CreateForumForm extends StatefulWidget {
  const CreateForumForm({Key? key}) : super(key: key);

  @override
  _CreateForumFormState createState() => _CreateForumFormState();
}

class _CreateForumFormState extends State<CreateForumForm> {
  String _selectedFileName = '';

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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0.0),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
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
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 12.0), // Adjust the padding
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Forum Category',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 12.0), // Adjust the padding
              ),
              value: 'Academics',
              items: <String>['Academics', 'Non-Academics'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Forum Description',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 12.0), // Adjust the padding
              ),
              maxLines: 2, // Set the maximum number of lines
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
                ElevatedButton(
                  onPressed: _selectImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(4.0),
                  ),
                  child: Icon(
                    Icons.upload_file,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
