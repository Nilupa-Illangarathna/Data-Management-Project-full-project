import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class MostOrderedCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String price;

  MostOrderedCard({
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(17 * WR, 4 * HR, 17 * WR, 4 * HR),
      width: double.maxFinite,
      height: 44 * HR,
      decoration: ShapeDecoration(
        color: Color(0xFF34C759),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imageAsset,
            width: 50 * WR,
            height: 50 * HR,
          ),
          SizedBox(width: 32 * WR),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16 * HR,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12 * HR,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(width: 24 * WR),
          Text(
            '\$$price',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28 * HR,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
