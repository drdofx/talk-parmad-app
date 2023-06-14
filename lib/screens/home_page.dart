import 'package:flutter/material.dart';
import 'package:talk_parmad/models/home_page.dart';
import 'package:talk_parmad/widgets/thread_card.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> apiResponse = [
    {
      "forum_id": 1,
      "forum_name": "Informatics",
      "forum_image":
          "https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg",
      "thread_id": 5,
      "title": "Saya butuh bantuan untuk membuat kalkulator di C++",
      "text": "lorem ipsum lorem ipsum"
    },
    {
      "forum_id": 2,
      "forum_name": "Game Dev",
      "forum_image": "",
      "thread_id": 4,
      "title": "Demonstrasi Capsule Collider dan Mesh Collider",
      "text": "lorem ipsum lorem ipsum"
    },
    {
      "forum_id": 1,
      "forum_name": "Informatics",
      "forum_image": "",
      "thread_id": 5,
      "title": "Cara menginstall Python di MacOS",
      "text": "lorem ipsum lorem ipsum"
    },
    {
      "forum_id": 4,
      "forum_name": "Design",
      "forum_image": "",
      "thread_id": 6,
      "title": "Bagaimana cara menggambar baju realistik?",
      "text": "lorem ipsum lorem ipsum"
    },
    {
      "forum_id": 3,
      "forum_name": "Business",
      "forum_image": "",
      "thread_id": 7,
      "title": "Apa yang dimaksud dengan blue and red ocean theory?",
      "text": "lorem ipsum lorem ipsum"
    },
    // Add more API response items here
  ];

  @override
  Widget build(BuildContext context) {
    List<HomePageModel> homePageData = apiResponse.map((data) {
      return HomePageModel.fromJson(data);
    }).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome back John Doe!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homePageData.length,
            itemBuilder: (BuildContext context, int index) {
              final homePageItem = homePageData[index];
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 16.0), // Add bottom margin
                child: ThreadCard(
                  homeData: homePageItem,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
