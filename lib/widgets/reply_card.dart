import 'package:flutter/material.dart';
import 'package:talk_parmad/models/reply_profile.dart';

class ReplyCard extends StatelessWidget {
  final ReplyProfile replyProfileData;

  ReplyCard({required this.replyProfileData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/thread',
          arguments: {'threadId': replyProfileData.thread.threadId},
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                            : Image.network(
                                'https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg',
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(height: 2.0),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          replyProfileData.forumName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        replyProfileData.thread.threadTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        replyProfileData.reply.replyText,
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
      ),
    );
  }
}
