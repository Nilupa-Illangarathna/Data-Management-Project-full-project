import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Widgets/home_module/atomic_widgets/shop_review.dart';

class RatingsSection extends StatelessWidget {
  final String Rating;
  final String Reviews;
  final String Food_Grade;

  RatingsSection({
    required this.Rating,
    required this.Reviews,
    required this.Food_Grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 35 * HR,
      color: Colors.transparent,
      width: 292 * WR,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleRating(
            iconPath: 'assets/images/homeScreen/homeScreen/rating/star.png',
            label: "Rating",
            value: Rating,
          ),
          VerticalDivider(thickness: 2 * WR,),
          SingleRating(
            iconPath: 'assets/images/homeScreen/homeScreen/rating/tick.png',
            label: "Reviews",
            value: Reviews,
          ),
          VerticalDivider(thickness: 2 * WR,),
          SingleRating(
            iconPath: 'assets/images/homeScreen/homeScreen/rating/medal.png',
            label: "Food Grade",
            value: Food_Grade,
          ),
        ],
      ),
    );
  }
}