import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


class ColorsClass{

  //CategoryEndColors
  final catColorOneEnd = HexColor("#6B5269");
  final catColorTwoEnd = HexColor("#6B5269");
  final catColorThreeEnd = HexColor("#6B5269");
  final catColorFourEnd = HexColor("#6B5269");
  final catColorFiveEnd = HexColor("#6B5269");
  final catColorSixEnd = HexColor("#6B5269");
  final catColorSevenEnd = HexColor("#6B5269");
  final catColorEightEnd = HexColor("#6B5269");
  final catColorNineEnd = HexColor("#6B5269");
  final catColorTenEnd = HexColor("#6B5269");
  final catColorElevenEnd = HexColor("#6B5269");
  final catColorTwelveEnd = HexColor("#6B5269");


  final HomepageBackground_Colour = HexColor("#8D93B4");

  final BasicButtonColor = Colors.teal.withOpacity(0.5);
}



