import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/Pages/HomePageModule/ShopDetailsPage/shop_details_page.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/Pages/HomePageModule/homePageScreen/home_screen.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/shop_items_data_notifier.dart';
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

class ProductDetailsPage extends StatefulWidget {
  final VoidCallback onClose;
  final PlaceCartData cartData;

  ProductDetailsPage({required this.onClose, required this.cartData});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0 * WR, right: 16.0 * WR, top: 16.0 * HR),
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
                                height:
                                    1.2727 * HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                                letterSpacing: -0.4 * WR,
                                color:
                                    Colors.black, // Set the text color to black
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF007AFF),
                            ),
                            SizedBox(width: 4.0 * WR),
                            Text(
                              tr('Back', context: context),
                              style: TextStyle(
                                fontFamily: "SF Pro Text",
                                fontSize: 17.0 * HR,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.408 * WR,
                                color: Color(0xFF007AFF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24 * HR), // Adjust as needed

                  Topic(
                    text: limitTextWithEllipsis(productInstance.placeName, 22),
                  ),
                  Text(
                    productInstance.location,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 17 * HR,
                      fontWeight: FontWeight
                          .w400, // FontWeight.w400 corresponds to a font-weight of 400 (regular)
                      height:
                          1.2727 * HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                      letterSpacing: -0.4 * WR,
                      color: Colors.black, // Set the text color to black
                    ),
                  ),

                  SizedBox(height: 24 * HR), // Adjust as needed

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${productInstance.numberOfCartItems<10? "0" + productInstance.numberOfCartItems.toString() : productInstance.numberOfCartItems.toString() } items",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 17 * HR,
                          fontWeight: FontWeight.w600, // FontWeight.w600 corresponds to a font-weight of 600 (semi-bold)
                          height: 1.2727 * HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
                          letterSpacing: -0.4 * WR,
                          color: Colors.black, // Set the text color to black
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Subtotal:",
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 17 * HR,
                                fontWeight: FontWeight.w400, // FontWeight.w600 corresponds to a font-weight of 600 (semi-bold)
                                height: 1.2727 * HR,
                                letterSpacing: -0.4 * WR,
                                color: Colors.grey, // Set the first word to grey
                              ),
                            ),
                            TextSpan(
                                text: limitTextWithEllipsis(" \$${productInstance.subTotal}", 20),
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 17 * HR,
                                fontWeight: FontWeight.w600, // FontWeight.w600 corresponds to a font-weight of 600 (semi-bold)
                                height: 1.2727 * HR,
                                letterSpacing: -0.4 * WR,
                                color: Colors.black, // Set the first word to grey
                              ),
                            ),
                          ],
                        ),
                      ),

    ],
                  ),

                  SizedBox(height: 12 * HR), // Adjust as needed



                  Container(
                    height: 148 *HR * productInstance.cartItems.length + 20,
                      child: CartItemListview(coffeeData: productInstance.cartItems)
                  ),

                ],
              ),
            ),
          ],
        ));
  }
}
