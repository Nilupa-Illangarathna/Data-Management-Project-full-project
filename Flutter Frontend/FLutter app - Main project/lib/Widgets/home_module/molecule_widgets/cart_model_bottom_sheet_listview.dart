import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/stateManagement/changeNotifiers/homePageModule/cart_data_notifier.dart';
import '/Widgets/home_module/atomic_widgets/cart_model_bottom_sheet_listview_item.dart';
import '/Widgets/home_module/molecule_widgets/cart_item_listview.dart';
import 'package:provider/provider.dart';

class CartModelBottomSheetListView extends StatefulWidget {

  //
  // CartModelBottomSheetListView({required this.itemList});




  @override
  _CartModelBottomSheetListViewState createState() => _CartModelBottomSheetListViewState();
}
class _CartModelBottomSheetListViewState extends State<CartModelBottomSheetListView> {
  late List<PlaceCartData> itemList;
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;
  @override
  void initState() {
    final CartItemsProvider = Provider.of<CartDataProvider>(context, listen: false);
    itemList = CartItemsProvider.CartListItems;
    // CartItemsProvider.printPlaceCartSummary();
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);
    // Use the provider to obtain the data
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final item = itemList[index];
        return index==0? Column(
          children: [
            SizedBox(height: 65 * HR,),
            Divider(
              color: Color(0xFFE5E5EA),
              thickness: 1.0 * HR,
              height: 1.0 * HR,
            ),
            // final int placeID;
            // final String placeName;
            // double subTotal;
            // final String location;
            // int numberOfCartItems;
            // List<Cart> cartItems; // Array of Cart items for the same placeID

            CartListviewItem(
              cartData: item,
              title: item.placeName,
              subtitle: item.location,
              imageUrl: item.cartItems[0].hotelDetails.imageUrl,
              quantity: item.cartItems.length,
              subtotal: item.subTotal,
              onItemClicked: (itemIndex) {
                print('Item clicked: $itemIndex');


              },
            ),
            Divider(
              color: Color(0xFFE5E5EA),
              thickness: 1.0 * HR,
              height: 1.0 * HR,
            ),
          ],
        ) : Column(
          children: [
            CartListviewItem(
              cartData: item,
              title: item.placeName,
              subtitle: item.location,
              imageUrl: item.cartItems[0].hotelDetails.imageUrl,
              quantity: item.cartItems.length,
              subtotal: item.subTotal,
              onItemClicked: (itemIndex) {
                print('Item clicked: $itemIndex');


              },
            ),
            Divider(
              color: Color(0xFFE5E5EA),
              thickness: 1.0 * HR,
              height: 1.0 * HR,
            ),
          ],
        );
      },
    );
  }
}
