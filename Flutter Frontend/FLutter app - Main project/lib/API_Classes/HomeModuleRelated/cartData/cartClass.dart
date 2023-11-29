
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';

import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';

class Cart {
  String cartID;
  String orderID; // New attribute
  int numberOfItems;
  double totalAmount;
  HotelData hotelDetails;
  late FoodItem productDetails;
  Map<String,Addon> addonsSet={};

  // List to keep track of used cartIDs
  static final Set<String> usedCartIDs = {};

  Cart({
    required this.cartID,
    required this.hotelDetails,
    required this.productDetails,
    required this.numberOfItems,
    required this.orderID, // Initialize orderID during object creation
    this.totalAmount = 0.0,
    required this.addonsSet,
  });

  // Print function to display the cart's attributes
  void printCartDetails() {
    print('Cart ID: $cartID');
    print('Order ID: $orderID'); // Print orderID
    print('Total Items: $numberOfItems');
    print('Total Amount: $totalAmount');

    print('Hotel Details:');
    hotelDetails.printHotelDataDetails();

    print('Product Details:');
    productDetails.printFoodItemDetails();
    addonsSet.forEach((addonName, addon) {
      print('  - Addon Name: $addonName');
      print('  - Addon Price: ${addon.addonPrice}');
      print('  - Is Added: ${addon.isAdded}');
    });
  }
  void printAddonDetails() {
    addonsSet.forEach((addonName, addon) {
      print('  - Addon Name: $addonName');
      print('  - Addon Price: ${addon.addonPrice}');
      print('  - Is Added: ${addon.isAdded}');
    });
  }

  // Single setter to update all properties
  void setCartProperties({
    required String newCartID,
    required int numberOfItems,
    required double newTotalAmount,
    required HotelData newHotelDetails,
    required FoodItem newProductDetails,
  }) {
    cartID = newCartID;
    numberOfItems = numberOfItems;
    totalAmount = newTotalAmount;
    hotelDetails = newHotelDetails;
    productDetails = newProductDetails;
  }

  // Function to generate a unique cartID
  static String generateUniqueCartID() {
    String newCartID;
    do {
      newCartID = 'CART_${DateTime.now().millisecondsSinceEpoch}';
    } while (usedCartIDs.contains(newCartID));

    usedCartIDs.add(newCartID);
    return newCartID;
  }
}





class PlaceCartData {
  final int placeID;
  final String placeName;
  double subTotal;
  final String location;
  int numberOfCartItems;
  List<Cart> cartItems; // Array of Cart items for the same placeID
  List<Map<String,Addon>> newaddonsSet;////Added  //0 th represents the 0 th addons set of cartItem 0 .. respectively..

  PlaceCartData({
    required this.placeID,
    required this.placeName,
    required this.location,
    this.subTotal = 0.0,
    this.numberOfCartItems = 0,
    this.cartItems = const [],
    this.newaddonsSet = const [],
  });

  void printPlaceCartData() {
    print('Place ID: $placeID');
    print('Place Name: $placeName');
    print('Location: $location');
    print('Sub Total: ${subTotal.toStringAsFixed(2)}');
    print('Number of Cart Items: $numberOfCartItems');
    print('Cart Items:');
    for (final cart in cartItems) { ////ADDED
      cart.printAddonDetails();
    }
    print('=================================');
  }

}
