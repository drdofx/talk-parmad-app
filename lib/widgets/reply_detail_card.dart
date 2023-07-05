import 'package:flutter/material.dart';

class ReplyDetailCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String replyText;
  final int numberOfUpvotes;
  final int numberOfDownvotes;
  final VoidCallback onUpvote;
  final VoidCallback onDownvote;

  ReplyDetailCard({
    required this.userName,
    required this.userImage,
    required this.replyText,
    required this.numberOfUpvotes,
    required this.numberOfDownvotes,
    required this.onUpvote,
    required this.onDownvote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(userImage),
                          radius: 24.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 4.0),
              Flexible(
                flex: 3,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              replyText,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: onUpvote,
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Colors.green,
                            ),
                            child: Icon(
                              Icons.thumb_up,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          // IconButton(
                          //     onPressed: onUpvote,
                          //     icon: Container(
                          //       width: 48,
                          //       height: 48,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: Colors.green,
                          //       ),
                          //       child: Icon(
                          //         Icons.thumb_up,
                          //         size: 24.0,
                          //         color: Colors.white,
                          //       ),
                          //     )),
                          // SizedBox(width: 4.0),
                          Text(
                            '$numberOfUpvotes',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          // SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: onDownvote,
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Colors.red,
                            ),
                            child: Icon(
                              Icons.thumb_down,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          // SizedBox(width: 4.0),
                          Text(
                            '$numberOfDownvotes',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
