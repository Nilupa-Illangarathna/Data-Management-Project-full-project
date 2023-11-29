import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '/Classes/enams/enum.dart';
import '/API_Classes/global_applications/global_applications.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';

class InsideShopDataNotifier extends ChangeNotifier {
  bool _isInitialized = false;
  Timer? _timer; //FIXME
  late List<FoodTypeSelector> FoodCategoryTypes; //All in this (globle for the session)
  late FoodTypeSelector selectedFoodType = FoodTypeSelector('NotAvailable'); // selected one from FoodCategoryTypes
  List<FoodItem> currentFoodSet=[]; //All the foods currently selected

  InsideShopDataNotifier() {
    // Initialize data here, or you can load data from API in the constructor.
    _isInitialized = true; // Set isInitialized to true once data is loaded.
    FoodCategoryTypes=[];
  }

  List<FoodTypeSelector> get all_current_food_types => FoodCategoryTypes; // related list of products
  List<FoodItem> get selected_food_items => currentFoodSet; // related list of products
  FoodTypeSelector get selected_food_category_type => selectedFoodType;  // pizzas, ice creams, alcohols etc
  bool get isInitialized => _isInitialized;

  // TODO below two functions are used to set any food item from anywhere
  // Function to get a food item by placeID and foodID
  // Function to get a food item by placeID and foodID, or return an empty initialized one
  FoodItem getFoodItemByIDs(int placeID, String foodID) {
    final foodItem = allFoodItems.firstWhere(
          (item) => item.placeID == placeID && item.foodID == foodID,
      orElse: () => FoodItem(
        placeID: placeID,
        foodID: foodID,
        imagePath: '', // Provide default values for other properties
        title: '',
        price: 0.0,
        rating: 0.0,
        category: '',
        description: '',
        extraAddons: {},
      ),
    );
    return foodItem;
  }


  // Function to set a food item as the current one
  void setCurrentFoodItem(FoodItem newFoodItem) {
    final index = allFoodItems.indexWhere(
          (item) => item.placeID == newFoodItem.placeID && item.foodID == newFoodItem.foodID,
    );

    if (index != -1) {
      // Replace the existing food item with the new one
      allFoodItems[index] = newFoodItem;
      setCurrent(allFoodItems);
    }
  }
  // TODO above two functions are used to set any food item from anywhere

  // Initislizing the dashboard
  Future<void> initData(HotelData hotelData) async { //TODO once per each shop entering.

    // TODO in this you have to handle the API request to get all the data related to this particuler place.
    // TODO SO the data you are taking shouold be assigned to allFoodItems ARRAY in lib/pages/HomePageModule/shopDetailsPage/placeData/place_data.dart location
    // After that the rest should be happening

    FoodCategoryTypes=placeDataList;

    List<FoodTypeSelector> selectedFoodCategoryTypes = getRandomSubset(FoodCategoryTypes, 2, 4); //FIXME this is NOT a  reqiered one. pass this. it is about selecting a set of categories to simulate

    initCategoryData(selectedFoodCategoryTypes[0]);

    FoodCategoryTypes = selectedFoodCategoryTypes;

    //FIltering based on the type and  get all the correct type stores
    currentFoodSet = filtered_places_returner(allFoodItems, selectedFoodType);

    notifyListeners();
  }


  // Initislizing the dashboard
  Future<void> initCategoryData(FoodTypeSelector item) async { //FIXME once per food type is changed
    selectedFoodType=item;
    currentFoodSet = filtered_places_returner(allFoodItems, selectedFoodType);
    print(currentFoodSet);
    notifyListeners();
  }


  void setCurrent(List<FoodItem> FoodSet) {
    currentFoodSet=FoodSet;
    notifyListeners();
  }


  //Filter and get data
  List<FoodItem> filtered_places_returner(List<FoodItem> actualLookingData, FoodTypeSelector foodType) {
    return actualLookingData.where((place) => place.category == foodType.category).toList();
  }


  // FIXME no need of this after ingegration
  List<FoodTypeSelector> getRandomSubset(List<FoodTypeSelector> array, int minItems, int maxItems) {
    final random = Random();
    final itemCount = random.nextInt(maxItems - minItems + 1) + minItems;

    if (itemCount >= array.length) {
      return List<FoodTypeSelector>.from(array);
    }

    final selectedIndices = <int>[];
    while (selectedIndices.length < itemCount) {
      final index = random.nextInt(array.length);
      if (!selectedIndices.contains(index)) {
        selectedIndices.add(index);
      }
    }

    final selectedItems = selectedIndices.map((index) => array[index]).toList();

    return selectedItems;
  }


// Dispose the timer when the provider is no longer needed (e.g., when the app is stopped).
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}




