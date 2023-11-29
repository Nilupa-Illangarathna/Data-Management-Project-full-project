import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/Pages/HomePageModule/ShopDetailsPage/shop_details_page.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/Pages/HomePageModule/homePageScreen/home_screen.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/Pages/HomePageModule/paymentGateway/place_your_order_screen.dart';
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
import '/Widgets/home_module/molecule_widgets/custom_price_detail_widget.dart';
import '/Widgets/home_module/molecule_widgets/custom_text_field.dart';
import '/Widgets/home_module/molecule_widgets/kyo_points_card.dart';
import '/Widgets/home_module/molecule_widgets/oreder_summary_item_card.dart';
import '/Widgets/home_module/molecule_widgets/oreder_summary_item_card.dart';
import '/Widgets/home_module/molecule_widgets/product_header.dart';
import 'package:provider/provider.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartData.dart';

class CheckOutScreen extends StatefulWidget {
  final VoidCallback onClose;
  final PlaceCartData cartData;

  CheckOutScreen({required this.onClose, required this.cartData});

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;
  // TODO CreateUser Api start
  bool isDineIn = true;
  final TextEditingController promoCodeInputField = TextEditingController();
  // TODO CreateUser Api end

  var isLoading = true;

  @override
  void initState() {
    // placeID = productInstance.placeID.toString();
    // foodID = productInstance.cartItems[0].productDetails.foodID.toString();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submitForm() {}

  bool isAddIcon = false;

  void KYO_pointHandler() {
    // TODO add the workload to manage the KYOPoints
    SetState();
  }

  void SetState() {
    setState(() {
      isAddIcon = !isAddIcon;
    });
  }

  List<String> getAllAddonNames(Cart cart) {
    List<String> addonNamesList = [];
    if (cart.productDetails.extraAddons != null) {
      for (final addon in cart.productDetails.extraAddons.values) {
        if (addon.addonName != null) {
          addonNamesList.add(addon.addonName);
        }
      }
    }
    return addonNamesList;
  }

  List<OrderSummaryItem> createTheCheckoutList(PlaceCartData cartData) {
    List<OrderSummaryItem> CheckoutList = [];
    if (cartData != null) {
      for (final cartItem in cartData.cartItems) {
        if (cartItem != null) {
          CheckoutList.add(OrderSummaryItem(
            itemCount: cartItem.numberOfItems,
            itemName: cartItem.productDetails.title,
            itemPrice: cartItem.totalAmount,
            itemDetails: getAllAddonNames(cartItem),
          ));
        }
      }
    }
    print(CheckoutList);
    return CheckoutList;
  }
  PayNowNavigator() { //TODO
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => PlaceYourOrderScreen(
            cartData: widget.cartData
        ),
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16.0 * WR,
                  right: 16.0 * WR,
                  top: 16.0 * HR,
                  bottom: 16 * HR),
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
                            "Checkout",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 17 * HR,
                                fontWeight: FontWeight
                                    .w500, // FontWeight.w500 corresponds to a font-weight of 500 (semi-bold)
                                height: 1.2727 *
                                    HR, // Line height can be calculated as line-height/font-size. 22/17 ≈ 1.2727
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
                              "Back",
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

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Preffered Method",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20 * HR,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 16 * HR,
                      ),

                      // ----------------------------------------buttons are included here(u can remove both and add ur own button)---------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double?>(0),
                                padding:
                                    MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.all(0),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  isDineIn
                                      ? Color(0xFF007AFF)
                                      : Color(0xFFF2F2F7),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                isDineIn = true;
                                SetState();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16 * WR, vertical: 0 * HR),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SvgPicture.asset(
                                        'assets/images/homeScreen/homeScreen/paymentRelated/dinein_icon.svg',
                                        width: 24 * WR,
                                        height: 24 * HR,
                                        colorFilter: ColorFilter.mode(
                                            isDineIn
                                                ? Colors.white
                                                : Colors.black,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8 * WR,
                                    ),
                                    Text(
                                      "Dine In",
                                      style: TextStyle(
                                        color: isDineIn
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 17 * HR,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8 * WR,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double?>(0),
                                padding:
                                    MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.all(0),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  !isDineIn
                                      ? Color(0xFF007AFF)
                                      : Color(0xFFF2F2F7),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                isDineIn = false;
                                SetState();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16 * WR, vertical: 0 * HR),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SvgPicture.asset(
                                        'assets/images/homeScreen/homeScreen/paymentRelated/material-symbols_fastfood.svg',
                                        width: 24 * WR,
                                        height: 24 * HR,
                                        colorFilter: ColorFilter.mode(
                                            !isDineIn
                                                ? Colors.white
                                                : Colors.black,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8 * WR,
                                    ),
                                    Text(
                                      "Take Away",
                                      style: TextStyle(
                                        color: !isDineIn
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 17 * HR,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //---------------------------------------------------------------------------------

                      SizedBox(
                        height: 16 * HR,
                      ),

                      //----------------------Payment Method -----------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment method",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20 * HR,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/images/homeScreen/homeScreen/paymentRelated/edit_square_icon.svg',
                            width: 20.5 * WR,
                            height: 20.5 * HR,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 16 * HR,
                      ),

                      //---------------------------------------------Payment Method buttons ----------------------
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double?>(0),
                                padding:
                                    MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.all(0),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF007AFF),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    30 * WR, 0 * HR, 16 * WR, 0 * HR),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SvgPicture.asset(
                                        'assets/images/homeScreen/homeScreen/paymentRelated/credit_card.svg',
                                        width: 24 * WR,
                                        height: 24 * HR,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16 * WR,
                                    ),
                                    Text(
                                      '**** **** **** 5323',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17 * HR,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8 * HR,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double?>(0),
                                padding:
                                    MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.all(0),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFF2F2F7),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    30 * WR, 0 * HR, 16 * WR, 0 * HR),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SvgPicture.asset(
                                        'assets/images/homeScreen/homeScreen/paymentRelated/credit_card.svg',
                                        width: 24 * WR,
                                        height: 24 * HR,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16 * WR,
                                    ),
                                    Text(
                                      '**** **** **** 5323',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17 * HR,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16 * HR,
                      ),
                      //----------------------------------------------Order Summary-------------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Summary",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20 * HR,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 16 * HR,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                createTheCheckoutList(widget.cartData).length,
                            itemBuilder: (context, index) {
                              final orderItem =
                                  createTheCheckoutList(widget.cartData)[index];
                              return OrderSummaryItem(
                                itemCount: orderItem.itemCount,
                                itemName: orderItem.itemName,
                                itemDetails: orderItem.itemDetails,
                                itemPrice: orderItem.itemPrice,
                              );

                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 8 * HR,
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8 * HR,
                      ),
                      Divider(
                        thickness: 1 * HR,
                      ),
                      //---------------------promo code--------------------------------------------------
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 24 * HR, horizontal: 0 * WR),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Promo Code",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17 * HR,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8 * HR,
                            ),
                            //---------call custom text field----------------
                            CustomTextField(
                              controller: promoCodeInputField,
                              hintText: "Enter Text",
                              onSuffixIconPressed: () {
                                promoCodeInputField.text = "";
                              },
                            ),
                          ],
                        ),
                      ),

                      //---------------------------------------12 KYO Points-------------------------
                      // KyoPointsCard(
                      //   text: tr('homeCheckout.kyo_points', context: context),
                      //   iconPath: isAddIcon
                      //       ? 'assets/images/homeScreen/homeScreen/icons/arrow_icons/add_icon.svg'
                      //       : 'assets/images/homeScreen/homeScreen/icons/arrow_icons/remove_icon.svg',
                      //   isAddIcon: isAddIcon,
                      //   onTap: KYO_pointHandler,
                      // ),

                      //--------------------checkout prices-------------------------------------------

                      Container(
                        padding: EdgeInsets.fromLTRB(0, 24 * HR, 0, 24 * HR),
                        child: Column(
                          children: [
                            //----------calling custom price widget---------------
                            PriceDetailsWidget(
                              title: "SubTotal",
                              value: widget.cartData.subTotal,
                            ),

                            SizedBox(
                              height: 8 * HR,
                            ),
                            // PriceDetailsWidget(
                            //   title: tr('homeCheckout.kyo_points', context: context),
                            //   value: 0.00, //TODO handle the KYO points related values
                            // ),

                            SizedBox(
                              height: 8 * HR,
                            ),
                            PriceDetailsWidget(
                              title: "Coupons",
                              value: 0.00, //TODO handle the Coupons related values
                            ),

                            SizedBox(
                              height: 8 * HR,
                            ),
                            PriceDetailsWidget(
                              title: "Taxes",
                              value: 0.00, //TODO handle the Taxes and Other Fees related values
                            ),

                            SizedBox(
                              height: 24 * HR,
                            ),
                            //----------------------------------------Total (didn't create a custom widget for this)----------------------------
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20 * HR,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '\$${widget.cartData.subTotal}', //TODO Total cost related value
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20 * HR,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double?>(0),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.all(0),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF007AFF),
                            ),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                          onPressed: () {
                            PayNowNavigator();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0 * HR, horizontal: 16 * WR),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                "Pay",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17 * HR,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
