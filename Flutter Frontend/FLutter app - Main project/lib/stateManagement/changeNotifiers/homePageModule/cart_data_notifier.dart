import 'package:flutter/material.dart';
import '/Classes/enams/enum.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartData.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';



class CartDataProvider extends ChangeNotifier {
  List<Cart> _categoryItems = [];
  bool _isInitialized = false;
  List<PlaceCartData> _cartDataListed = [];

  CartDataProvider() {
    // Initialize data here, or you can load data from API in the constructor.
    _categoryItems = dummyCartArray; // You can replace this with your data-loading logic
    _isInitialized = true; // Set isInitialized to true once data is loaded.
    // _setupTimer(); //FIXME
    generatePlaceCartData();
  }

  void changeNotifier(){
    generatePlaceCartData();
  }


  void generatePlaceCartData() {
    final Map<int, PlaceCartData> placeCartMap = {};

    for (final cart in _categoryItems) {
      final placeID = cart.hotelDetails.PlaceID;

      if (!placeCartMap.containsKey(placeID)) {
        placeCartMap[placeID] = PlaceCartData(
          placeID: placeID,
          placeName: cart.hotelDetails.name,
          location: cart.hotelDetails.location,
          subTotal: cart.totalAmount,
          cartItems: [cart],
        );
      } else {
        placeCartMap[placeID]!.subTotal += cart.totalAmount; // Accumulate subTotal
        placeCartMap[placeID]!.numberOfCartItems++;
        placeCartMap[placeID]!.cartItems.add(cart);
      }
    }

    final List<PlaceCartData> placeCartList = placeCartMap.values.toList();
    _cartDataListed = placeCartList;
    notifyListeners();
  }

  void printPlaceCartSummary() {
    for (final placeCartData in _cartDataListed) {
      for (int i=0;i< placeCartData.numberOfCartItems;i++){
        placeCartData.printPlaceCartData();
      }
      print('=================================');
    }
  }



  //Getting all Cart items in the correct form
  List<PlaceCartData> get CartListItems => _cartDataListed;


// Update ordered items and return current count (inc/dec)
  void updateOrderedItemsCount(int placeID, String foodID, String operation) {
    final cartItem = _categoryItems.firstWhere(
            (cart) =>
        cart.hotelDetails.PlaceID == placeID &&
            cart.productDetails.foodID == foodID,
        orElse: () => Cart(hotelDetails: HotelData(isVisited: "false", rating: "", food_grade: "", reviews: "", name: "", address: "", imageUrl: "", isFavorite: false, isRecommended: "false", location: "", LocationType: CustomPlaceType.cafe, PlaceID: 0,positiveSummary: '',negativeSummmary: '',longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0), productDetails: FoodItem(category: "", description: "", extraAddons: {}, foodID: "", imagePath: "", placeID: 0, price: 0, rating: 0, title: ""), cartID: "", numberOfItems: 0, orderID: "", totalAmount: 0, addonsSet: {} )
    );

    if (cartItem != null) {
      if (operation == 'inc') {
        // print("NOP");
        cartItem.numberOfItems++;
      } else if (operation == 'dec' && cartItem.numberOfItems > 0) {
        // print("DOP");
        cartItem.numberOfItems--;
      }
      notifyListeners(); // Notify listeners to trigger UI update
    }
    notifyListeners();
  }


// Dispose the timer when the provider is no longer needed (e.g., when the app is stopped).
  @override
  void dispose() {
    // _timer?.cancel();
    super.dispose();
  }


}













//
// // Update ordered items and return current count (inc/dec)
// int updateOrderedItemsCount(int placeID, String foodID, String operation) {
//   final cartItem = dummyCartArray.firstWhere(
//           (cart) => cart.hotelDetails.PlaceID == placeID && cart.productDetails.foodID == foodID,
//       orElse: () => Cart(hotelDetails: HotelData(isVisited: "false", rating: "", food_grade: "", reviews: "", name: "", address: "", imageUrl: "", isFavorite: false, isRecommended: "false", location: "", LocationType: CustomPlaceType.cafe, PlaceID: 0), productDetails: FoodItem(category: "", description: "", extraAddons: {}, foodID: "", imagePath: "", placeID: 0, price: 0, rating: 0, title: "",), cartID: "", numberOfItems: 0, orderID: "", totalAmount: 0 )
//   );
//
//   if (cartItem == null) {
//     return 0; // Item not found
//   }
//
//   if (operation == 'inc') {
//     cartItem.numberOfItems++;
//   } else if (operation == 'dec' && cartItem.numberOfItems > 0) {
//     cartItem.numberOfItems--;
//   }
//
//   return cartItem.numberOfItems;
// }
//
// // Remove item with zero orders for a specific placeID and foodID.
// void removeItemWithNoOrders(int placeID, String foodID) {
//   dummyCartArray.removeWhere((cart) =>
//   cart.hotelDetails.PlaceID == placeID &&
//       cart.productDetails.foodID == foodID &&
//       cart.numberOfItems == 0);
// }
//
// // Set the totalAmount price of a Cart entry for a placeID and foodID.
// void setCartEntryPrice(int placeID, String foodID, double newTotalAmount) {
//   final cartItem = dummyCartArray.firstWhere(
//           (cart) => cart.hotelDetails.PlaceID == placeID && cart.productDetails.foodID == foodID,
//       orElse: () => Cart(hotelDetails: HotelData(isVisited: "false", rating: "", food_grade: "", reviews: "", name: "", address: "", imageUrl: "", isFavorite: false, isRecommended: "false", location: "", LocationType: CustomPlaceType.cafe, PlaceID: 0), productDetails: FoodItem(category: "", description: "", extraAddons: {}, foodID: "", imagePath: "", placeID: 0, price: 0, rating: 0, title: "",), cartID: "", numberOfItems: 0, orderID: "", totalAmount: 0 ));
//
//   if (cartItem != null) {
//     cartItem.totalAmount = newTotalAmount;
//   }
// }
//
//
