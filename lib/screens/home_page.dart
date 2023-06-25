import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_parmad/controllers/home_controller.dart';
import 'package:talk_parmad/models/home_page.dart';
import 'package:talk_parmad/widgets/thread_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, homeController, _) {
        return RefreshIndicator(
          onRefresh: homeController.refreshData,
          child: FutureBuilder<List<HomePageModel>>(
            future: homeController.fetchThreadData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while fetching the data
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Handle the error case
                return Text('Error: ${snapshot.error}');
              } else {
                // Data fetched successfully
                final List<HomePageModel> homePageData = snapshot.data ?? [];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, top: 8, bottom: 12),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Welcome back to Talk',
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
                            padding: const EdgeInsets.only(bottom: 16.0),
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
            },
          ),
        );
      },
    );
  }
}
