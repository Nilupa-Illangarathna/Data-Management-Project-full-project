import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartData.dart';
import '/stateManagement/changeNotifiers/homePageModule/cart_data_notifier.dart';
import '/Widgets/common/common_right_sided_blue_text_button.dart';
import '/Widgets/home_module/molecule_widgets/cart_model_bottom_sheet_listview.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import 'package:provider/provider.dart';

class CartModelBottomSheet extends StatefulWidget {
  final VoidCallback onClose;

  CartModelBottomSheet({required this.onClose});

  @override
  _CartModelBottomSheetState createState() => _CartModelBottomSheetState();
}

class _CartModelBottomSheetState extends State<CartModelBottomSheet> {

  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;
  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);
    // Use the provider to obtain the data
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: containerColor,
      ),
      child:


      Stack(
        children: [

          // Include the ItemList with the provided CartArray
          CartModelBottomSheetListView(),

          // Consumer<CartDataProvider>(
          //   builder: (context, CartProvider, child) {
          //     CartProvider.printPlaceCartSummary();
          //     return CartModelBottomSheetListView(
          //       itemList: CartProvider.CartListItems,
          //     );
          //   },
          // ),


          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // SizedBox(
              //   height: 8,
              // ),
              Container(
                color: containerColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0 * WR,vertical: 8 * HR),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "Baskets",
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 18 * HR,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.4 * WR,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: widget.onClose,
                            child: RightSidedBlueTextButton(
                              onPress: widget.onClose,
                              text: "Close",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
