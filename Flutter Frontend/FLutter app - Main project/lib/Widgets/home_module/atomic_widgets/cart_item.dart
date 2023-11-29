import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';
import '/Widgets/home_module/atomic_widgets/quentity_selector.dart';

class ReusableCoffeeWidget extends StatefulWidget {
  final Cart coffeedata;
  late String coffeeName;
  late String imagePath;
  late String quantity;
  late double price;
  late double? normalPrice;
  late VoidCallback? onRemovePressed;
  late VoidCallback? onAddPressed;


  // coffeeName: widget.coffeeData[index].productDetails.title,
  // imagePath: widget.coffeeData[index].productDetails.imagePath,
  // quantity: widget.coffeeData[index].numberOfItems.toString(),
  // price: widget.coffeeData[index].productDetails.price,
  // normalPrice: widget.coffeeData[index].productDetails.price,

  ReusableCoffeeWidget({
    required this.coffeedata,
    // required this.coffeeName,
    // required this.imagePath,
    // required this.quantity,
    // required this.price,
    // this.normalPrice,
    // this.onRemovePressed,
    // this.onAddPressed,
  });

  @override
  State<ReusableCoffeeWidget> createState() => _ReusableCoffeeWidgetState();
}

class _ReusableCoffeeWidgetState extends State<ReusableCoffeeWidget> {
  //TODO values are considered here
  int selectedQuantity = 1;
  double addonPrice= 0;
  double totalPrice = 0;



  void processMap(Map<String, Addon> inputMap) {
    // Use the forEach function to iterate over key-value pairs
    addonPrice=0;
    inputMap.forEach((key, addon) {
      print("state is" + addon.isAdded.toString());
      if(addon.isAdded){
        addonPrice += addon.addonPrice;
      }
    });
    setState(() {});
  }


  @override
  void initState() {
    selectedQuantity = widget.coffeedata.numberOfItems;
    processMap(widget.coffeedata.productDetails.extraAddons);
    totalPrice= (addonPrice + widget.coffeedata.productDetails.price) * selectedQuantity;
  }

  // void updateUI(){setState(() {
  //   selectedQuantity = widget.coffeedata.numberOfItems;
  //   processMap(widget.coffeedata.productDetails.extraAddons);
  //   totalPrice= (addonPrice + widget.coffeedata.productDetails.price) * selectedQuantity;
  // });}

  // Function to update the selected quantity
  void addItems(bool isAdding) {
    selectedQuantity = widget.coffeedata.numberOfItems;
    processMap(widget.coffeedata.productDetails.extraAddons);
    totalPrice= isAdding? totalPrice + (addonPrice + widget.coffeedata.productDetails.price) : totalPrice - (addonPrice + widget.coffeedata.productDetails.price);
    // setState(() {
    //   print(selectedQuantity);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 132 * HR,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 16 * HR,
            child: SizedBox(
              width: 255 * WR,
              child: Text(
                widget.coffeedata.productDetails.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17 * HR,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 8 * HR,
            child: Container(
              width: 62 * WR,
              height: 62 * HR,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.coffeedata.productDetails.imagePath,),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 20 * HR,
            child:
            Container(
              width: selectedQuantity<10? 120 * WR: 130 * WR,
              height: 36 * HR,
              padding: EdgeInsets.fromLTRB(7 * WR, 8 * HR, 7 * WR, 8 * HR),
              decoration: BoxDecoration(
                color: Color(0xFF007AFF),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(100),
                  right: Radius.circular(100),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                        if (selectedQuantity > 0) {
                          --selectedQuantity;
                          addItems(false);
                          // updateUI();
                        }
                    },
                    icon: Icon(Icons.remove, color: Colors.white),
                    padding: EdgeInsets.all(0),
                  ),
                  Text(
                    selectedQuantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17 * HR,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                        ++selectedQuantity;
                        addItems(true);
                        // updateUI();
                      setState(() {

                      });
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                    padding: EdgeInsets.all(0),
                  ),
                ],
              ),
            )


            // QuantitySelector(
            //   initialValue: selectedQuantity,
            //   color: Color(0xFF007AFF),
            //   text_color: Colors.white,
            //   onSelectedQuantityChanged: updateSelectedQuantity, // Pass the function
            // ),
          ),
          Positioned(
            right: 0,
            bottom: 10,
            child: Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$$totalPrice'+"0",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (widget.coffeedata.productDetails.price != widget.coffeedata.productDetails.price)
                    Text(
                      '\$$totalPrice'+'0',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF8E8E93),
                        fontSize: 13,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
