import 'package:flutter/material.dart';
import '/API_Classes/global_applications/global_applications.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/Widgets/home_module/atomic_widgets/conditional_image.dart';

class VisitedPlaceCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String address;
  final String rating;
  final String location;

  VisitedPlaceCard({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.rating,
    required this.location,
  });

  @override
  State<VisitedPlaceCard> createState() => _VisitedPlaceCardState();
}

class _VisitedPlaceCardState extends State<VisitedPlaceCard> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme ? Colors.black.withOpacity(0.3) : theme.primaryColor.withOpacity(0.15);

    return Container(
      width: 300 * WR,
      height: 120 * HR,
      margin: EdgeInsets.symmetric(vertical: 8 * HR),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 80 * WR,
              height: 80 * HR,
              child: ConditionalImage(
                imageUrl: widget.imageUrl,
              ),
            ),
          ),
          SizedBox(width: 16 * WR),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  limitTextWithEllipsis(widget.name, 12),
                  style: TextStyle(
                    fontSize: 20 * HR,
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : theme.primaryColor,
                  ),
                ),
                SizedBox(height: 8 * HR),
                Text(
                  limitTextWithEllipsis(widget.location, 18),
                  style: TextStyle(
                    fontSize: 16 * HR,
                    color: isDarkTheme ? Colors.grey.withOpacity(0.7) : theme.focusColor.withOpacity(0.65),
                  ),
                ),
                SizedBox(height: 8 * HR),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: isDarkTheme ? Colors.grey.withOpacity(0.7) : theme.focusColor.withOpacity(0.65),
                      size: 18 * HR,
                    ),
                    SizedBox(width: 8 * WR),
                    Text(
                      widget.rating.toString(),
                      style: TextStyle(
                        fontSize: 16 * HR,
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? Colors.grey.withOpacity(0.7) : theme.focusColor.withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
