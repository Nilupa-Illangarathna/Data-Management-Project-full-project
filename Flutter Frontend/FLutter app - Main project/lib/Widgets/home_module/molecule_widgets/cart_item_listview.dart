import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/stateManagement/changeNotifiers/homePageModule/cart_data_notifier.dart';
import '/Widgets/home_module/atomic_widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartItemListview extends StatefulWidget {

  final List<Cart> coffeeData;

  CartItemListview({required this.coffeeData});

  @override
  State<CartItemListview> createState() => _CartItemListviewState();
}

class _CartItemListviewState extends State<CartItemListview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.coffeeData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            index==widget.coffeeData.length-1?
            Column(
              children: [
                Divider(
                  thickness: 1 * HR,
                ),


                Consumer<CartDataProvider>(
                  builder: (context, CartProvider, child) {
                    return ReusableCoffeeWidget(
                      coffeedata:widget.coffeeData[index],
                      // coffeeName: widget.coffeeData[index].productDetails.title,
                      // imagePath: widget.coffeeData[index].productDetails.imagePath,
                      // quantity: widget.coffeeData[index].numberOfItems.toString(),
                      // price: widget.coffeeData[index].productDetails.price,
                      // normalPrice: widget.coffeeData[index].productDetails.price,
                      // onRemovePressed: () {
                      //   // CartProvider.updateOrderedItemsCount(
                      //   //     widget.coffeeData[index].productDetails.placeID,
                      //   //     widget.coffeeData[index].productDetails.foodID,
                      //   //     "dec");
                      // },
                      // onAddPressed: () {
                      //   // CartProvider.updateOrderedItemsCount(
                      //   //     widget.coffeeData[index].productDetails.placeID,
                      //   //     widget.coffeeData[index].productDetails.foodID,
                      //   //     "inc");
                      // },
                    );
                  },
                ),



                Divider(
                  thickness: 1 * HR,
                ),
              ],
            ):
            Column(
              children: [
                Divider(
                  thickness: 1 * HR,
                ),
                ReusableCoffeeWidget(
                  coffeedata:widget.coffeeData[index],
                  // coffeeName: widget.coffeeData[index].productDetails.title,
                  // imagePath: widget.coffeeData[index].productDetails.imagePath,
                  // quantity: widget.coffeeData[index].numberOfItems.toString(),
                  // price: widget.coffeeData[index].productDetails.price,
                  // normalPrice: widget.coffeeData[index].productDetails.price,
                  // onRemovePressed: () {
                  //   // Add your remove logic here4
                  // },
                  // onAddPressed: () {
                  //   // Add your add logic here
                  // },
                ),
              ],
            ),

          ],
        );
      },
    );
  }
}
