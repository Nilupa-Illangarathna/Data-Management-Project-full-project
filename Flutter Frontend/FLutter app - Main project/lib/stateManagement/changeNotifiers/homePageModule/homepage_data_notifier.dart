import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '/API_Classes/HomeModuleRelated/homepageData/homepage_data.dart';


class CategoryDataProvider extends ChangeNotifier {
  List<CategoryItemData> _categoryItems = [];
  bool _isInitialized = false;
  Timer? _timer; //FIXME

  CategoryDataProvider() {
    // Initialize data here, or you can load data from API in the constructor.
    _categoryItems = PlaceTypesDataList; // You can replace this with your data-loading logic
    _isInitialized = true; // Set isInitialized to true once data is loaded.
    // _setupTimer(); //FIXME
  }

  List<CategoryItemData> get categoryItems => _categoryItems;
  bool get isInitialized => _isInitialized;

  void updateCategoryItems(List<CategoryItemData> newCategoryItems) {
    _categoryItems = newCategoryItems;
    notifyListeners();
  }


  // Asynchronous setter for RecommendedPlacesDataList
  Future<void> setRecommendedPlaces(List<CategoryItemData> newOptions) async {

    // TODO API call to get all the data prior to get into the frontend.
    await Future.delayed(Duration(seconds: 1)); // This delay represents the time taken to do the api call
    // TODO API call to get all the data prior to get into the frontend.

    _categoryItems = newOptions;
    notifyListeners();
  }

// Dispose the timer when the provider is no longer needed (e.g., when the app is stopped).
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


}