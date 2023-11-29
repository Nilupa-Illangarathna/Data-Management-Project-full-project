import '/Classes/enams/enum.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';


final List<Cart> dummyCartArray = [
  // Cart(
  //   cartID: Cart.generateUniqueCartID(),
  //   orderID: 'ORDER_001',
  //   numberOfItems: 1,
  //   totalAmount: 25.0,
  //   hotelDetails: HotelData(
  //     PlaceID: 1,
  //     LocationType: CustomPlaceType.restaurant,
  //     isFavorite: false,
  //     isRecommended: 'yes',
  //     isVisited: 'yes',
  //     imageUrl: 'image_url_1',
  //     name: 'Restaurant 1',
  //     address: 'Address 1',
  //     location: 'Location 1',
  //     rating: '4.5',
  //     reviews: '150',
  //     food_grade: 'A',
  //   ),
  //   productDetails: FoodItem(
  //     placeID: 1,
  //     foodID: 'food_001',
  //     imagePath: 'food_image_1',
  //     title: 'Food Item 1',
  //     price: 10.0,
  //     rating: 4.0,
  //     category: 'Main Course',
  //     description: 'Description 1',
  //     extraAddons: {},
  //   ),
  // ),
  // Cart(
  //   cartID: Cart.generateUniqueCartID(),
  //   orderID: 'ORDER_002',
  //   numberOfItems: 1,
  //   totalAmount: 32.0,
  //   hotelDetails: HotelData(
  //     PlaceID: 1,
  //     LocationType: CustomPlaceType.restaurant,
  //     isFavorite: false,
  //     isRecommended: 'yes',
  //     isVisited: 'yes',
  //     imageUrl: 'image_url_1',
  //     name: 'Restaurant 1',
  //     address: 'Address 1',
  //     location: 'Location 1',
  //     rating: '4.5',
  //     reviews: '150',
  //     food_grade: 'A',
  //   ),
  //   productDetails: FoodItem(
  //     placeID: 1,
  //     foodID: 'food_002',
  //     imagePath: 'food_image_2',
  //     title: 'Food Item 2',
  //     price: 8.0,
  //     rating: 4.2,
  //     category: 'Desserts',
  //     description: 'Description 2',
  //     extraAddons: {},
  //   ),
  // ),
  // Cart(
  //   cartID: Cart.generateUniqueCartID(),
  //   orderID: 'ORDER_003',
  //   numberOfItems: 3,
  //   totalAmount: 18.0,
  //   hotelDetails: HotelData(
  //     PlaceID: 1,
  //     LocationType: CustomPlaceType.restaurant,
  //     isFavorite: false,
  //     isRecommended: 'yes',
  //     isVisited: 'yes',
  //     imageUrl: 'image_url_1',
  //     name: 'Restaurant 1',
  //     address: 'Address 1',
  //     location: 'Location 1',
  //     rating: '4.5',
  //     reviews: '150',
  //     food_grade: 'A',
  //   ),
  //   productDetails: FoodItem(
  //     placeID: 1 ,
  //     foodID: 'food_003',
  //     imagePath: 'food_image_3',
  //     title: 'Food Item 3',
  //     price: 7.0,
  //     rating: 4.5,
  //     category: 'Pizza',
  //     description: 'Description 3',
  //     extraAddons: {},
  //   ),
  // ),
  // Cart(
  //   cartID: Cart.generateUniqueCartID(),
  //   orderID: 'ORDER_004',
  //   numberOfItems: 5,
  //   totalAmount: 15.0,
  //   hotelDetails: HotelData(
  //     PlaceID: 4,
  //     LocationType: CustomPlaceType.club,
  //     isFavorite: true,
  //     isRecommended: 'yes',
  //     isVisited: 'yes',
  //     imageUrl: 'image_url_4',
  //     name: 'Bakery 4',
  //     address: 'Address 4',
  //     location: 'Location 4',
  //     rating: '4.2',
  //     reviews: '120',
  //     food_grade: 'A',
  //   ),
  //   productDetails: FoodItem(
  //     placeID: 4,
  //     foodID: 'food_004',
  //     imagePath: 'food_image_4',
  //     title: 'Food Item 4',
  //     price: 6.0,
  //     rating: 4.3,
  //     category: 'Bakery Items',
  //     description: 'Description 4',
  //     extraAddons: {},
  //   ),
  // ),
];