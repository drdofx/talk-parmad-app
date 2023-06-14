import 'package:flutter/material.dart';
import 'package:talk_parmad/models/reply_profile.dart';

class ReplyCard extends StatelessWidget {
  final ReplyProfile replyProfileData;

  ReplyCard({required this.replyProfileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 12.0), // Add left and right padding
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80.0,
                      width: double.infinity,
                      child: replyProfileData.forumImage != ""
                          ? Image.network(
                              replyProfileData.forumImage,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image_not_supported),
                    ),
                    SizedBox(height: 2.0),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        replyProfileData.forumName,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      replyProfileData.threadTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0), // Add spacing here
                    Text(
                      replyProfileData.replyText,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
