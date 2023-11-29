import '/Classes/enams/enum.dart';

class CategoryItemData {
  final String ID;
  final CustomPlaceType categoryType;
  final String iconImagePath;
  final String categoryName;

  CategoryItemData({
    required this.ID,
    required this.categoryType,
    required this.iconImagePath,
    required this.categoryName,
  });
}

List<CategoryItemData> PlaceTypesDataList = [
  CategoryItemData(
    ID: "5",
    categoryType: CustomPlaceType.hotel,
    iconImagePath: 'assets/images/hotel_icon.png',
    categoryName: 'Hotels',
  ),
  CategoryItemData(
    ID: "3",
    categoryType: CustomPlaceType.club,
    iconImagePath: 'assets/images/clubs_icon.png',
    categoryName: 'Clubs',
  ),
  CategoryItemData(
    ID: "2",
    categoryType: CustomPlaceType.restaurant,
    iconImagePath: 'assets/images/restaurants_icon.png',
    categoryName: 'Restaurants',
  ),
  CategoryItemData(
    ID: "1",
    categoryType: CustomPlaceType.cafe,
    iconImagePath: 'assets/images/cafe_icon.png',
    categoryName: 'Cafés',
  ),
  CategoryItemData(
    ID: "4",
    categoryType: CustomPlaceType.bar,
    iconImagePath: 'assets/images/bar_icon.png',
    categoryName: 'Bars',
  ),
  // Add more items as needed
];
