import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarTitle;
  CustomAppBar({required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16 * WR),
      child: IntrinsicWidth(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF007AFF),
              ),
              Text(
                // "Login",
                appBarTitle,
                style: TextStyle(
                  fontFamily: "SF Pro Text",
                  fontSize: 17.0 * HR,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.408 * WR,
                  color: Color(0xFF007AFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
