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
        final List<HomePageModel> homePageData = homeController.homePageData;

        return RefreshIndicator(
          onRefresh: homeController.refreshData,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome back, John Doe!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                homePageData.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 8.0, right: 8.0, bottom: 16.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'No interesting threads found.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'Join a forum now!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
          ),
        );
      },
    );
  }
}
