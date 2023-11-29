import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/Classes/responsiveness/responsiveness.dart';

class KyoPointsCard extends StatelessWidget {
  final String text;
  final String iconPath;
  final bool isAddIcon;
  final VoidCallback? onTap;

  KyoPointsCard({
    required this.text,
    required this.iconPath,
    required this.isAddIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.centerLeft,
          width: double.maxFinite,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1 * WR, color: Color(0xFFE2E2E2)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0 * HR, horizontal: 16.0 * WR),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20 * HR,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8 * HR,
                    ),
                    Text(
                      tr('homeCheckout.kyo_points_introduction', context: context),
                      style: TextStyle(
                        color: Color(0xFF8E8E93),
                        fontSize: 12 * HR,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(

            onTap: onTap,
            child: Container(
              width: 55 * WR,
              height: 116 * HR,
              padding: EdgeInsets.only(left: 16 * WR, right: 16 * WR),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Color(0xFF007AFF)),
              child: SvgPicture.asset(
                iconPath,
                width: 24 * WR,
                height: 24 * HR,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
