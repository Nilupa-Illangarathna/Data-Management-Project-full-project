import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/API_Classes/global_applications/global_applications.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/global_applications/theme.dart';
import '../../main.dart';

class CustomSnackBars {
  static show(String? message) {
    message ??= tr('commonAlerts.something_went_wrong');
    // Wrap the Scaffold in a Builder widget to obtain the root ScaffoldMessenger
    final scaffoldMessenger =
        ScaffoldMessenger.of(navigatorKey.currentContext!);
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: "SF Pro Text",
          fontSize: 14.0 * HR,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.408 * WR,
        ),
      ),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.fixed,
      shape: LinearBorder.none,
    ));
  }

//use this when using bottom sheets
  static showAlert(String? message, BuildContext context) {
    message ??= tr('commonAlerts.something_went_wrong');
    // Wrap the Scaffold in a Builder widget to obtain the root ScaffoldMessenger
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: "SF Pro Text",
          fontSize: 14.0 * HR,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.408 * WR,
        ),
      ),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.fixed,
      shape: LinearBorder.none,
    ));
  }
}
