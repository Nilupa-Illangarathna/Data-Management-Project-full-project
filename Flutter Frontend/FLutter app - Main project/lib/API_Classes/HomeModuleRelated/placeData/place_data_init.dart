import 'dart:math';

import '/API_Classes/HomeModuleRelated/placeData/place_data.dart';

class Addon {
  final String addonName;
  final double addonPrice;
  bool isAdded;

  Addon({
    required this.addonName,
    required this.addonPrice,
    this.isAdded = false,
  });

}



class FoodItem {
  // Food related
  late final int placeID;
  late String foodID;
  late String imagePath;
  late String title;
  late double price;
  late double rating;
  late String category;
  late String description;
  late Map<String, Addon> extraAddons;

  FoodItem({
    required this.placeID,
    required this.foodID,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.category,
    required this.description,
    required this.extraAddons,
  });

  // Setter for placeID
  void setPlaceID(int placeID) {
    this.placeID = placeID;
  }

  // Getter for extraAddons
  Map<String, Addon> getExtraAddons() {
    return extraAddons;
  }

  // Method to reset the isAdded attribute for all addons
  void resetAddonIsAdded() {
    extraAddons.forEach((addonName, addon) {
      addon.isAdded = false;
    });
  }

  // Method to print a list of food items
  void printFoodItemDetails() {
    print('Place ID: $placeID');
    print('Food ID: $foodID');
    print('Image Path: $imagePath');
    print('Title: $title');
    print('Price: $price');
    print('Rating: $rating');
    print('Category: $category');
    print('Description: $description');
    print('Extra Addons:');
    extraAddons.forEach((addonName, addon) {
      print('  - Addon Name: $addonName');
      print('  - Addon Price: ${addon.addonPrice}');
      print('  - Is Added: ${addon.isAdded}');
    });
  }
}

class FoodItemManager {
  //
  final List<FoodItem> allFoodItems;

  FoodItemManager(this.allFoodItems);

  // Method to acquire all categories as a Set
  Set<String> getAllCategories() {
    final categories =
        allFoodItems.map((foodItem) => foodItem.category).toSet();
    return categories;
  }

  // Method to filter food items by category and get a randomized subset
  List<FoodItem> filterAndRandomizeCategory(String category, int subsetSize) {
    final filteredItems = allFoodItems
        .where((foodItem) => foodItem.category == category)
        .toList();

    if (filteredItems.length <= subsetSize) {
      // If there are fewer items than the requested subset size, return all items.
      return filteredItems;
    } else {
      // Shuffle the items randomly and select a subset of the specified size.
      filteredItems.shuffle();
      final randomizedSubset = filteredItems.sublist(0, subsetSize);
      return randomizedSubset;
    }
  }

  // Method to map and add filtered categories as PlaceData objects
  List<FoodTypeSelector> mapAndAddCategories() {
    final categories = getAllCategories();
    final placeDataList =
        categories.map((category) => FoodTypeSelector(category)).toList();
    return placeDataList;
  }
}

//TODO USE THIS AS THE INIT CLASS
final foodItemManager = FoodItemManager(allFoodItems);

class FoodTypeSelector {
  late String category;

  FoodTypeSelector(this.category);
}

FoodTypeSelector createPlaceData(String category) {
  return FoodTypeSelector(category);
}

List<FoodTypeSelector> placeDataList = foodItemManager.mapAndAddCategories();
