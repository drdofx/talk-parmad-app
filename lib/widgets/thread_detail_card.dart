import 'package:flutter/material.dart';

class ThreadDetailCard extends StatelessWidget {
  final String threadTitle;
  final String threadText;
  final List<Map<String, dynamic>> creatorData;

  ThreadDetailCard({
    required this.threadTitle,
    required this.threadText,
    required this.creatorData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(creatorData[0]["userImage"]),
                    radius: 38.0,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          creatorData[0]["userName"],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${creatorData[0]["major"]} - ${creatorData[0]["year"]}',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '${creatorData[0]["isActive"] ? "Active Student" : "Inactive Student"}',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child:
                          IconButton(icon: Icon(Icons.edit), onPressed: () {})),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              threadTitle,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              threadText,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
