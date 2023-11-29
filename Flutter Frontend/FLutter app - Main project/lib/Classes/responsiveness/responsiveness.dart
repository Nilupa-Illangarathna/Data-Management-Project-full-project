import 'package:flutter/widgets.dart';

class CustomMQ {
    static double designDisplayHeight = 812; // iPhone 13 mini height size
    static double designDisplayWidth = 375; // iPhone 13 mini width size

    static double get mediaQueryHeight => MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
    static double get mediaQueryWidth => MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;

    static double get HR => mediaQueryHeight / designDisplayHeight;
    static double get WR => mediaQueryWidth / designDisplayWidth;

    static double LBHR (int componentHeight){ // For Layoutbuilder widget to makesure the compojnents are fit to the screen
        return (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height * componentHeight/designDisplayHeight);
    }
    static double LBWR (int componentWidth){
        return (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width * componentWidth/designDisplayHeight);
    }
}


//responsiveness
CustomMQ customMQ = CustomMQ();
final HR = CustomMQ.HR;
final WR = CustomMQ.WR;