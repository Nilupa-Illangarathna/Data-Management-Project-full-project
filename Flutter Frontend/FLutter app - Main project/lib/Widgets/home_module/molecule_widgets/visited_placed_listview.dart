import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/Widgets/home_module/atomic_widgets/visited_places_card.dart';

class VisitedPlaceListView extends StatelessWidget {
  final List<HotelData> data;
  final Function(HotelData) onItemClick;

  VisitedPlaceListView({
    required this.data,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Container(
          margin: index==data.length-1? EdgeInsets.only(top: 8 * HR, bottom: 8 * HR) : EdgeInsets.only(top: 8 * HR),
          child: InkWell(
            onTap: () {
              onItemClick(item);
            },
            child: VisitedPlaceCard(
              imageUrl: item.imageUrl,
            rating: item.rating,
              name: item.name,
              address: item.address,
              location: item.location,
            ),
          ),
        );
      },
    );
  }
}
