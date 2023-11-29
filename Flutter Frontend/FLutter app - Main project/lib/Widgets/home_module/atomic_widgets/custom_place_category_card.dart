import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class CustomCategoryItem extends StatefulWidget {
  final String iconImagePath;
  final String categoryName;
  final VoidCallback onClick; // Specify the expected function type

  CustomCategoryItem({
    required this.iconImagePath,
    required this.categoryName,
    required this.onClick, // Update the parameter type
  });

  @override
  State<CustomCategoryItem> createState() => _CustomCategoryItemState();
}

class _CustomCategoryItemState extends State<CustomCategoryItem> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;

  late Color containerColor;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.grey.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4 * WR,vertical: 4 * HR),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1 * WR, color: Color(0xFFE5E5EA)),
        ),
        child: Row(
          children: [
            Container(
              height: 47 * HR,
              width: 47 * WR,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.iconImagePath),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: 4 * WR),
            Text(
              widget.categoryName,
              style: TextStyle(
                color: isDarkTheme? Colors.grey: theme.hintColor,
                fontSize: 15 * HR,
                // fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 4 * WR),
          ],
        ),
      ),
    );
  }
}
