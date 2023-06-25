import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/home_page.dart';
import 'package:talk_parmad/services/home_service.dart';

class HomeController extends ChangeNotifier {
  final HomeService homeService;

  HomeController({
    required this.homeService,
  });

  Future<List<HomePageModel>> fetchThreadData() async {
    try {
      final response = await homeService.fetchData();
      final responseData = response['data'] as List<dynamic>;
      final homePageData =
          responseData.map((data) => HomePageModel.fromJson(data)).toList();

      print(homePageData[0]);

      // notifyListeners();

      return homePageData;
    } catch (e) {
      print('fetch data failed: $e');
      return [];
    }
  }

  Future<void> refreshData() async {
    // Call the API again to fetch the updated data
    await fetchThreadData();
    notifyListeners();
  }
}
