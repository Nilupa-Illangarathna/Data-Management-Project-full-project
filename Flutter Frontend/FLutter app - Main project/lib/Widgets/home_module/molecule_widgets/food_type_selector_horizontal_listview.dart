// food_type_selector_horizontal_listview.dart
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';

class FoodTypeSelectorHorizontalListview extends StatefulWidget {
  final List<FoodTypeSelector> items;
  final Function(FoodTypeSelector) onItemClick;

  FoodTypeSelectorHorizontalListview({
    required this.items,
    required this.onItemClick,
  });

  @override
  _FoodTypeSelectorHorizontalListviewState createState() =>
      _FoodTypeSelectorHorizontalListviewState();
}

class _FoodTypeSelectorHorizontalListviewState
    extends State<FoodTypeSelectorHorizontalListview> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);

    return Container(
      height: 40 * HR,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.onItemClick(item);
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 8 * WR),
              padding: EdgeInsets.fromLTRB(25 * WR, 11 * HR, 25 * WR, 11 * HR),
              decoration: BoxDecoration(
                color: isSelected ? theme.primaryColor.withOpacity(0.35) : theme.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(9.55),
              ),
              child: Text(
                item.category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
