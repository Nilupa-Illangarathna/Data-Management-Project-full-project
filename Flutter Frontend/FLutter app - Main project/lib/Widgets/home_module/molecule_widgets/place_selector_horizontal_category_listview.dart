import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/homepageData/homepage_data.dart';
import '/widgets/home_module/atomic_widgets/custom_place_category_card.dart';

class PlaceSelectorHorizontalListview extends StatelessWidget {
  final List<CategoryItemData> items;
  final Function(CategoryItemData) onItemClick;

  PlaceSelectorHorizontalListview({
    required this.items,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48 * HR,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: EdgeInsets.only(right: 8 * WR),
            child: CustomCategoryItem(
              iconImagePath: item.iconImagePath,
              categoryName: item.categoryName,
              onClick: () {
                onItemClick(item); // Pass the item to the click handler
              },
            ),
          );
        },
      ),
    );
  }
}
