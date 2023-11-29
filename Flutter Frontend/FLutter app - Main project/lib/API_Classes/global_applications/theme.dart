import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class KyoSyncTheme {
  final Color _primaryColor = const Color(0xff0A84FF);
  final Color _background = const Color(0xffF8F9FB);
  final Color _onBackGround = Colors.black;

  final Color _error = const Color(0xff56A5CC);
  final Color _warning = const Color(0xFFFDCF41);
  final Color _success = const Color(0xFF5CFF7E);

  Color get primaryColor => _primaryColor;
  Color get backgroundColor => _background;
  Color get onBackGroundColor => _onBackGround;

  Color get errorColor => _error;
  Color get warningColor => _warning;
  Color get successColor => _success;

  ThemeData get theme => _getThemeData();

  ThemeData _getThemeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: "SF Pro Text",
          fontSize: 17.0 * HR,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.408 * WR,
          color: const Color(0xFF007AFF),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF007AFF),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      fontFamily: 'SFProDisplay',
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        primary: _primaryColor,
        onBackground: _onBackGround,
        background: _background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            fixedSize: const Size(250, 50)),
      ),
    );
  }
}
