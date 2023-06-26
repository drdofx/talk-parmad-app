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
          child: ListView.builder(
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
        );
      },
    );
  }
}
