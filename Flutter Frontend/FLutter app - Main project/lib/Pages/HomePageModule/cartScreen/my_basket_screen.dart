// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/Pages/HomePageModule/ShopDetailsPage/shop_details_page.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/Pages/HomePageModule/homePageScreen/home_screen.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/Pages/HomePageModule/paymentGateway/checkOut.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/shop_items_data_notifier.dart';
import '/Widgets/common/common_blue_themed_cancel_button.dart';
import '/Widgets/common/common_blue_themed_submit_button.dart';
import '/Widgets/common/common_page_topic.dart';
import '/Widgets/common/common_text_form_field.dart';
import '/Widgets/home_module/atomic_widgets/custom_passage.dart';
import '/Widgets/home_module/atomic_widgets/quentity_selector.dart';
import '/Widgets/home_module/molecule_widgets/addon_listview.dart';
import '/Widgets/home_module/molecule_widgets/cart_item_listview.dart';
import '/Widgets/home_module/molecule_widgets/product_header.dart';
import 'package:provider/provider.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartData.dart';

class CartDetailsPage extends StatefulWidget {
  final VoidCallback onClose;
  final PlaceCartData cartData;

  CartDetailsPage({required this.onClose, required this.cartData});

  @override
  _CartDetailsPageState createState() => _CartDetailsPageState();
}

class _CartDetailsPageState extends State<CartDetailsPage> {

  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  // TODO CreateUser Api start
  late PlaceCartData productInstance = widget.cartData;
  late var placeID;
  late var foodID;
  // TODO CreateUser Api end

  var isLoading = true;

  @override
  void initState() {
    placeID = productInstance.placeID.toString();
    foodID = productInstance.cartItems[0].productDetails.foodID.toString();
    productInstance.printPlaceCartData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submitForm() {}



  // void addItemNavigation() {
  //   Navigator.of(context).push(
  //     PageRouteBuilder(
  //       pageBuilder: (context, animation, secondaryAnimation) => ShopDetailsPage(
  //
  //         hotelData: widget.cartData.cartItems[0].hotelDetails,),
  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //         const begin = Offset(1.0, 0.0); // Slide from right to left
  //         const end = Offset.zero;
  //         var tween = Tween(begin: begin, end: end);
  //         var offsetAnimation = animation.drive(tween);
  //         return SlideTransition(position: offsetAnimation, child: child);
  //       },
  //     ),
  //   );
  // }
  void _openBottomSheet(HotelData data) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        ShopDetailsPage(hotelData: data),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  void checkOutNavigation() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => CheckOutScreen(
            onClose: () {
              Navigator.of(context).pop();
            },
            cartData: widget.cartData),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);
    // Use the provider to obtain the data

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: containerColor,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.0 * WR,
                right: 16.0 * WR,
                top: 16.0 * HR,
                bottom: 0 * HR),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height-170 * HR,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent, // No background
                                padding: EdgeInsets.all(0), // No extra padding
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "My Basket",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontSize: 17 * HR,
                                          fontWeight: FontWeight
                                              .w500, // FontWeight.w500 corresponds to a font-weight of 500 (semi-bold)
                                          height: 1.2727 *
                                              HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                                          letterSpacing: -0.4 * WR,
                                          color: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        color: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.7),
                                      ),
                                      SizedBox(width: 4.0 * WR),
                                      Text(
                                        "Back",
                                        style: TextStyle(
                                          fontFamily: "SF Pro Text",
                                          fontSize: 17.0 * HR,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.408 * WR,
                                          color: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24 * HR), // Adjust as needed


                            Text(
                              limitTextWithEllipsis(productInstance.placeName, 22),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 32 * HR,
                                fontWeight: FontWeight
                                    .w600, // FontWeight.w400 corresponds to a font-weight of 400 (regular)
                                height: 1.2727 *
                                    HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                                letterSpacing: -0.4 * WR,
                                color: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              productInstance.location,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 17 * HR,
                                fontWeight: FontWeight
                                    .w400, // FontWeight.w400 corresponds to a font-weight of 400 (regular)
                                height: 1.2727 *
                                    HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                                letterSpacing: -0.4 * WR,
                                color: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.5),
                              ),
                            ),

                            SizedBox(height: 24 * HR), // Adjust as needed

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${productInstance.numberOfCartItems < 10 ? "0" + productInstance.cartItems.length.toString() : productInstance.cartItems.length.toString()} " + "items",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 17 * HR,
                                    fontWeight: FontWeight
                                        .w600, // FontWeight.w600 corresponds to a font-weight of 600 (semi-bold)
                                    height: 1.2727 *
                                        HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                                    letterSpacing: -0.4 * WR,
                                    color: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.right,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Subtotal" + ":",
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontSize: 17 * HR,
                                          fontWeight: FontWeight
                                              .w400, // FontWeight.w600 corresponds to a font-weight of 600 (semi-bold)
                                          height: 1.2727 * HR,
                                          letterSpacing: -0.4 * WR,
                                          color:
                                              Colors.grey, // Set the first word to grey
                                        ),
                                      ),
                                      TextSpan(
                                        text: limitTextWithEllipsis(
                                            " \$${productInstance.subTotal}", 20),
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontSize: 17 * HR,
                                          fontWeight: FontWeight
                                              .w600, // FontWeight.w600 corresponds to a font-weight of 600 (semi-bold)
                                          height: 1.2727 * HR,
                                          letterSpacing: -0.4 * WR,
                                          color: Colors
                                              .black, // Set the first word to grey
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 12 * HR), // Adjust as needed

                            Container(
                                height:
                                    148 * HR * productInstance.cartItems.length + 20 * HR,
                                child: CartItemListview(
                                    coffeeData: productInstance.cartItems)
                            ),

                            SizedBox(height: 24 * HR,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 20 * HR,
                                    fontWeight: FontWeight.w600, // FontWeight.w600 corresponds to a font-weight of 600 (semi-bold)
                                    height: 1.2727 * HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                                    letterSpacing: -0.4 * WR,
                                    color: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.4),
                                  ),
                                ),

                                Text(
                                  "\$${productInstance.subTotal}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 20 * HR,
                                    fontWeight: FontWeight.w600, // FontWeight.w600 corresponds to a font-weight of 600 (semi-bold)
                                    height: 1.2727 * HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                                    letterSpacing: -0.4 * WR,
                                    color: Colors.black, // Set the text color to black
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 96 * HR,),

                          ],
                        ),
                      ),
                    ),



                    Column(
                      children: [
                        MainBlueSubmitButton(
                          height: 56 * HR,
                          text: "Checkout",
                          onPressed: checkOutNavigation,
                          inProgress: false,
                        ),
                        SizedBox(height: 8 * HR), // Adjust as needed
                        MainBlueCancelButton(
                          text: "Add Items",
                          onPressed: () {
                            _openBottomSheet(widget.cartData.cartItems[0].hotelDetails);
                          },
                        ),
                        SizedBox(
                          height: 16 * HR,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
