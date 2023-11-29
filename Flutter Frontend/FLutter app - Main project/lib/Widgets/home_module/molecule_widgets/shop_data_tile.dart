import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/Widgets/home_module/atomic_widgets/visited_places_card.dart';

class SeeMoreListview extends StatelessWidget {
  final List<HotelData> data;
  final Function(HotelData) onItemClick;

  SeeMoreListview({
    required this.data,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Container(
          margin: index==data.length-1? EdgeInsets.only(top: 8 * HR, bottom: 8 * HR) : EdgeInsets.only(top: 8 * HR),
          child: InkWell(
            onTap: () {
              onItemClick(item);
            },
            child: RestaurantItem(
                item: item,
                name: item.name,
                address: item.address + " " + item.location,
                imagePath: item.imageUrl,
                favourite: 'assets/images/homeScreen/homeScreen/icons/arrow_icons/favorite.png'
            ),
          ),
        );
      },
    );
  }
}



class StarRating extends StatelessWidget {
  final String rating;

  StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/homeScreen/homeScreen/icons/arrow_icons/star.png',
          width: 12,
          height: 12,
        ),
        SizedBox(width: 4),
        Text(
          rating.toString(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: "SF Pro",
          ),
        ),
      ],
    );
  }
}
class RestaurantItem extends StatelessWidget {
  final HotelData item;
  final String name;
  final String address;
  final String imagePath;
  final String favourite;

  RestaurantItem({required this.item, required this.name, required this.address, required this.imagePath, required this.favourite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 294 * WR,
      height: 88 * HR,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0), // Adjust the value as needed
            child: Image.asset(
              imagePath,
              width: 88 * WR,
              height: 88 * HR,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(left: 16 * WR),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  limitTextWithEllipsis(name, 28),
                  style: TextStyle(
                    fontSize: 17 * HR,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: "SF Pro",
                  ),
                ),
                SizedBox(height: 8 * HR),
                Text(
                  limitTextWithEllipsis(address, 30),
                  style: TextStyle(
                    fontSize: 12 * HR,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: "SF Pro",
                  ),
                ),
                StarRating(rating: item.rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


