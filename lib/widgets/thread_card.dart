import 'package:flutter/material.dart';
import 'package:talk_parmad/models/forum.dart';
import 'package:talk_parmad/models/home_page.dart';
import 'package:talk_parmad/models/thread.dart';

class ThreadCard extends StatelessWidget {
  final HomePageModel homeData;

  ThreadCard({required this.homeData});

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
                      child: homeData.forumImage != ""
                          ? Image.network(
                              homeData.forumImage,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image_not_supported),
                    ),
                    SizedBox(height: 2.0),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        homeData.forumName,
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
                child: Container(
                  height: 100.0,
                  child: Center(
                    child: Text(
                      homeData.threadTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
