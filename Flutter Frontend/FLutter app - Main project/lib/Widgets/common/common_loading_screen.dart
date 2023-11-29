import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Widgets/common/common_circular_progress_indicator.dart';

class KyosyncLoader {
  static void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            // Intercept the back button press and return false to prevent dialog from popping
            return false;
          },
          child: Dialog(
            //backgroundColor: Colors.white.withOpacity(0.1),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Container(
              margin: EdgeInsets.only(top: 25 * HR),
              height: 120 * HR,
              width: 30 * WR,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LoadingIndicator(),
                   SizedBox(
                    height: 10 * HR,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      fontFamily: "SF Pro Text",
                      fontSize: 17.0 * HR,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.408 * WR,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
