import 'package:flutter/material.dart';
import 'package:talk_parmad/controllers/create_controller.dart';
import 'package:talk_parmad/widgets/create_forum_form.dart';

class CreateForumPage extends StatelessWidget {
  final CreateForumController createForumController;

  const CreateForumPage({
    Key? key,
    required this.createForumController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Create a new forum!',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        CreateForumForm(createForumController: createForumController),
      ],
    );
  }
}
