import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:io';
import 'dart:core';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/Pages/HomePageModule/productDetailsPage/product_details_page.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';

class ProductTileList extends StatefulWidget {
  final HotelData hotelData;
  final List<FoodItem> products;

  ProductTileList({required this.hotelData, required this.products});

  @override
  State<ProductTileList> createState() => _ProductTileListState();
}

class _ProductTileListState extends State<ProductTileList> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: buildProductTiles(widget.products),
    );
  }

  Widget buildProductTiles(List<FoodItem> products) {
    List<Widget> rows = [];
    for (int rowIndex = 0; rowIndex < (products.length / 2).ceil(); rowIndex++) {
      final startIndex = rowIndex * 2;
      final endIndex = (startIndex + 2 <= products.length) ? startIndex + 2 : products.length;

      List<Widget> rowChildren = products
          .sublist(startIndex, endIndex)
          .map((product) => ProductTile(
        product:product,
        imagePath: product.imagePath,
        title: product.title,
        price: product.price.toString(),
        rating: product.rating,
        hotelData: widget.hotelData,
      ))
          .toList();

      rows.add(Row(children: rowChildren));
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0 * WR),
      child: Column(children: rows),
    );
  }
}

class ProductTile extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final double rating;
  final FoodItem product;
  final HotelData hotelData;

  ProductTile({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.product,
    required this.hotelData,
  });

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  void onClick() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ProductDetailsPage(product: widget.product, hotelData: widget.hotelData),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0 * WR, vertical: 4.0 * HR),
        child: Container(
          height: (MediaQuery.of(context).size.width - (8 + 16 + 16) * HR) / 2,
          width: (MediaQuery.of(context).size.width - (8 + 16 + 16) * WR) / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15 * WR, vertical: 10 * HR),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent,theme.primaryColor.withOpacity(0.85)],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            // fontFamily: 'SF Pro',
                            fontSize: 17 * HR,
                            fontWeight: FontWeight.w700,
                            color: isDarkTheme? Colors.white.withOpacity(0.3) :theme.secondaryHeaderColor.withOpacity(0.90),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.price,
                              style: TextStyle(
                                color: isDarkTheme? Colors.white.withOpacity(0.3) :theme.secondaryHeaderColor.withOpacity(0.90),
                                fontFamily: 'SF Pro',
                                fontSize: 14 * HR,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: isDarkTheme? Colors.white.withOpacity(0.3) :theme.secondaryHeaderColor.withOpacity(0.90),
                                  size: 14 * HR,
                                ),
                                SizedBox(width: 12 * WR),
                                Text(
                                  widget.rating.toString(),
                                  style: TextStyle(
                                    color: isDarkTheme? Colors.white.withOpacity(0.3) :theme.secondaryHeaderColor.withOpacity(0.90),
                                    fontFamily: 'SF Pro',
                                    fontSize: 13 * HR,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
