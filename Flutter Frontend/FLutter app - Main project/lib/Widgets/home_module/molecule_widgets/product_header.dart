import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import 'package:provider/provider.dart';

class ProductHeaderCard extends StatefulWidget {
  final HotelData placeData;
  final String imagePath;
  final String price;
  final String title;
  final bool isFavorite;
  final Function(bool) onFavoritePressed;
  final Function() onNavigationPressed;

  const ProductHeaderCard({
    Key? key,
    required this.placeData,
    required this.imagePath,
    required this.price,
    required this.title,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onNavigationPressed,
  }) : super(key: key);

  @override
  _ProductHeaderCardState createState() => _ProductHeaderCardState();
}

class _ProductHeaderCardState extends State<ProductHeaderCard> {
  bool isFavorite = false;

  void setFavorite(){
    setState(() {
      final place = Provider.of<HotelDataProvider>(context, listen: false);
      isFavorite = !isFavorite;
      if (place != null) {
        // Make necessary changes to the place
        HotelData item =  place.getPlaceByID(widget.placeData.PlaceID);
        item.isFavorite = !isFavorite;
        // Set the updated place
        place.setPlaceByID(widget.placeData.PlaceID, item);
      }
      final place1 = Provider.of<HotelDataProvider>(context, listen: false);
      place.notifyListenersUpdated();
      print("The current state is: " + place1.getPlaceByID(widget.placeData.PlaceID).isFavorite.toString() );

    });
  }

  @override
  void initState() {
    super.initState();
    isFavorite = !widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: [
          Container(
            height: 166 * HR,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          Container(

            height: 166 * HR,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(1), Colors.transparent],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14 * WR, vertical: 12 * HR),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28 * HR,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(width: 16 * WR), // Margin of 16 pixels

                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 9 * WR,top: 9 * HR),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setFavorite();
                          },
                          child: Container(
                            width: 36 * WR,
                            height: 36 * HR,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: Center(
                              child: Container(
                                width: 16 * WR,
                                height: 13.96 * HR,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      isFavorite
                                          ? "assets/images/favorite_icon_filled.png"
                                          : "assets/images/favorite_icon.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 9 * WR,bottom: 9 * HR),
                    child: Row(
                      children: [
                        Text(widget.price + "\$",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w600),)
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
