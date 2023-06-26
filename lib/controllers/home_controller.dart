import 'package:flutter/foundation.dart';
import 'package:talk_parmad/models/home_page.dart';
import 'package:talk_parmad/services/home_service.dart';

class HomeController extends ChangeNotifier {
  final HomeService homeService;

  HomeController({
    required this.homeService,
  });

  List<HomePageModel> _homePageData = [];

  List<HomePageModel> get homePageData => _homePageData;

  Future<void> fetchThreadData() async {
    try {
      final response = await homeService.fetchData();
      final responseData = response['data'] as List<dynamic>;
      final List<HomePageModel> updatedData =
          responseData.map((data) => HomePageModel.fromJson(data)).toList();

      _homePageData = updatedData;
      notifyListeners();
    } catch (e) {
      print('Fetch data failed: $e');
    }
  }

  Future<void> refreshData() async {
    // Call the API again to fetch the updated data
    await fetchThreadData();
  }
}
