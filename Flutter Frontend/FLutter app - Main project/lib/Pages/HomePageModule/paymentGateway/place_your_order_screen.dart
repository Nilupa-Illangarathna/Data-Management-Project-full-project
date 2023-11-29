// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/Pages/HomePageModule/paymentGateway/completion_screen.dart';

class PlaceYourOrderScreen extends StatefulWidget {
  final PlaceCartData cartData;
  const PlaceYourOrderScreen({super.key, required this.cartData});

  @override
  State<PlaceYourOrderScreen> createState() =>
      _PlaceYourOrderScreenState();
}

class _PlaceYourOrderScreenState extends State<PlaceYourOrderScreen> with TickerProviderStateMixin {

  //TODO Use Below
  late AnimationController controller;

  // Variables for hardcoded values
  String pickupAddress = "Royal Avenue, Sunny Terrace, Colombo 4"; //todo
  Map<String, int> preparationTimeRange = {"min": 25, "max": 30}; //todo
  List<Map<String, dynamic>> orderSummary = [
    // {"item": "Iced Coffee", "quantity": 1},
    // {"item": "Spring Roll", "quantity": 3},
    // {"item": "Spring Rollee", "quantity": 2},
    // Add more items as needed
  ];

  //TODO Use Above


  void addItemToOrderSummary(String itemName, int quantity) {
    setState(() {
      orderSummary.add({"item": itemName, "quantity": quantity});
    });
  }
  void create_list(){
    for (final cartItem in widget.cartData.cartItems) {
      addItemToOrderSummary(cartItem.productDetails.title, cartItem.numberOfItems);
    }
  }

  void CompletionScreenNavigation() {
    // Delay navigation by 4 seconds
    Future.delayed(Duration(seconds: 8), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => CompletionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Slide from right to left
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    });
  }

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
      setState(() {});
    });
    create_list();
    CompletionScreenNavigation();  // FIXME Timer navigation
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100 * HR,),
          Center(
            child:  SizedBox(
              height: 150 * HR,
              width: 150 * WR,
              child: CircularProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Circular progress indicator',
                strokeWidth: 10 * WR, // Change the stroke width
              ),
            ),
          ),
          SizedBox(height: 56 * HR,),
          Padding(
            padding:  EdgeInsets.only(left: 16 * WR),
            child: Text(
              "Placing Order",
              style: TextStyle(
                fontSize: 34 * WR,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "SF Pro",
              ),
            ),
          ),
          buildRowWithIconAndText(
            'assets/images/homeScreen/homeScreen/icons/arrow_icons/near_me.png',
            "Pickup Address",
            pickupAddress,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16 * WR),
            child: Divider(
              thickness: 1 * HR,
            ),
          ),
          buildRowWithIconAndText(
            'assets/images/homeScreen/homeScreen/icons/arrow_icons/schedule.png',
            'Preparation Time',
            'Standard Preparation' + " ${preparationTimeRange['min']}-${preparationTimeRange['max']} " + 'Minutes' ,

          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16 * WR),
            child: Divider(
              thickness: 1 * HR,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16 * WR, top: 24 * HR),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/homeScreen/homeScreen/icons/arrow_icons/sticky_note.png',
                  width: 18 * WR,
                  height: 18 * HR,
                ),
                SizedBox(width: 16 * WR,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Order Summary",
                        style: TextStyle(
                          fontSize: 17 * HR,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: "SF Pro",
                        )
                    ),
                    SizedBox(height: 8 * HR,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: buildOrderSummary(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build rows with icon and text
  Widget buildRowWithIconAndText(String iconPath, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(left: 16 * WR, top: 24 * HR, bottom: 24 * HR),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            iconPath,
            width: 20 * WR,
            height: 20 * HR,
          ),
          SizedBox(width: 16 * WR),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17 * HR,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: "SF Pro",
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13 * HR,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7D7D7D),
                  fontFamily: "SF Pro",
                ),
              ),
              Divider(
                color: Color(0xFF9E9E9E),
                thickness: 1 * HR,
                height: 0,
              ),
            ],
          ),
        ],
      ),
    );
  }


  // Helper method to build order summary ListView
  List<Widget> buildOrderSummary() {
    return orderSummary.map((item) {
      return Container(
        width: 303 * WR,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item["item"],
              style: TextStyle(
                fontSize: 13 * HR,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: "SF Pro",
              ),
            ),
            SizedBox(width: 100 * WR,),
            Text(
              "x${item["quantity"]}",
              style: TextStyle(
                fontSize: 13 * HR,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "SF Pro",
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

}



