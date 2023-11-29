import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Widgets/home_module/atomic_widgets/hotel_recommendations_card.dart';

import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';

class HorizontalHotelListView extends StatefulWidget {
  final List<HotelData> items;
  final Function(HotelData) onItemClick;

  HorizontalHotelListView({
    required this.items,
    required this.onItemClick,
  });

  @override
  State<HorizontalHotelListView> createState() => _HorizontalHotelListViewState();
}

class _HorizontalHotelListViewState extends State<HorizontalHotelListView> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;
  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme
        ? Colors.black.withOpacity(0.3)
        : theme.primaryColor.withOpacity(0.15);
    return Container(
      height: 290 * HR, // Set the full component height to 256px
      color: Colors.transparent,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return HotelRecommendationCard(
            imageUrl: item.imageUrl,
            rating: item.rating,
            name: item.name,
            address: item.address + " " +item.location,
            onClick: () {
              widget.onItemClick(item); // Pass the item to the click handler
            },
          );
        },
      ),
    );
  }
}
