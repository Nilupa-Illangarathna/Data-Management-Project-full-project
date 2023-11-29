import 'package:flutter/material.dart';
import 'dart:math';


class RandomImageSelectorClass{
  Random randomNumber = Random();

  String HomeScreenSwipeUpImageProvider(){
    List addressArr = [
      'assets/Homescreen/Random_Vector_Images/Day01.png',
      'assets/Homescreen/Random_Vector_Images/Day02.png',
      'assets/Homescreen/Random_Vector_Images/Day03.png',
      'assets/Homescreen/Random_Vector_Images/Day04.png',
      'assets/Homescreen/Random_Vector_Images/Night03.png',
      'assets/Homescreen/Random_Vector_Images/Night04.png'];

    return addressArr[randomNumber.nextInt(addressArr.length)];
  }

  double HomeScreenSwipeUpImage_Offset_Provider(){
    List addressArr = [
      0.0,
      -0.3,
      -0.5
    ];
    return addressArr[randomNumber.nextInt(addressArr.length)];
  }

  String HomeScreenClapmedImageProvider(){
    List addressArr = [
      'assets/Homescreen/Random_Vector_Images/Day01.png',
      'assets/Homescreen/Random_Vector_Images/Day02.png',
      'assets/Homescreen/Random_Vector_Images/Day03.png',
      'assets/Homescreen/Random_Vector_Images/Day04.png',
      'assets/Homescreen/Random_Vector_Images/Night01.png',
      'assets/Homescreen/Random_Vector_Images/Night02.png',
      'assets/Homescreen/Random_Vector_Images/Night03.png',
      'assets/Homescreen/Random_Vector_Images/Night04.png'];

    return addressArr[randomNumber.nextInt(addressArr.length)];
  }

  jsonObj HomeScreenClapmedJSONAnimationProvider(){
    List addressArr = [
      jsonObj('assets/Homescreen/Random_Vector_Images/A travel.json',0.8),
      jsonObj('assets/Homescreen/Random_Vector_Images/A play.json',1.2)
    ];
    return addressArr[randomNumber.nextInt(addressArr.length)];
  }
}


class jsonObj {
  String address;
  double ratio;
  jsonObj(this.address,this.ratio);
}