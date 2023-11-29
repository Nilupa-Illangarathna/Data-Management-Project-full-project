import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import 'package:provider/provider.dart';

class CafeHeaderCard extends StatefulWidget {
  final int placeID;
  final String imagePath;
  final String location;
  final String title;
  late bool isFavorite=false;
  final Function(bool) onFavoritePressed;
  final Function() onNavigationPressed;

  CafeHeaderCard({
    Key? key,
    required this.placeID,
    required this.imagePath,
    required this.location,
    required this.title,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onNavigationPressed,
  }) : super(key: key);

  @override
  _CafeHeaderCardState createState() => _CafeHeaderCardState();
}

class _CafeHeaderCardState extends State<CafeHeaderCard> {
  bool isFavorite = false;

  void setFavorite(){
      setState(() {
        final place = Provider.of<HotelDataProvider>(context, listen: false);
        isFavorite = !isFavorite;
        if (place != null) {
          // Make necessary changes to the place
          HotelData item =  place.getPlaceByID(widget.placeID);
          item.isFavorite = !isFavorite;
          // Set the updated place
          place.setPlaceByID(widget.placeID, item);
        }
        final place1 = Provider.of<HotelDataProvider>(context, listen: false);
        print("The current state is: " + place1.getPlaceByID(widget.placeID).isFavorite.toString() );
        place.notifyListenersUpdated();
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
            top: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(9 * WR, 3 * HR, 9 * WR, 3 * HR),
                  width: 222 * WR,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    widget.location,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12 * HR,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * WR, vertical: 20 * HR),
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
                          fontSize: 34 * HR,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Open ",
                              style: TextStyle(
                                color: Color(0xFF34C759),
                                fontSize: 13 * HR,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '- 8.00AM ' + "to" + ' 6.30PM ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13 * HR,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16 * WR,bottom: 16 * HR),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap:() {
                            setFavorite();
                          },
                          child: Container(
                            width: 36 * WR,
                            height: 36 * HR,
                            margin: EdgeInsets.only(right: 8 * WR), // Maintain a gap of 8 pixels
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
                        GestureDetector(
                          onTap: () {
                            // Handle navigation button press here
                            widget.onNavigationPressed();
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
                                height: 16 * HR,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/assistant_navigation_icon.png"),
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
            ],
          )
        ],
      ),
    );
  }
}
