import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  final bool isDarkTheme;
  final ThemeData theme;
  final double opacity;

  PageContainer({required this.child, required this.isDarkTheme, required this.theme, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        // height: MediaQuery.of(context).size.width * 2/9,
        // margin: isDarkTheme ?
        // EdgeInsets.only(top: 4.0 + MediaQuery.of(context).size.width * 1/9 + 16 + 0.0, left: 4, bottom: 4, right: 4 ) :
        // EdgeInsets.only(top: 4.0 + MediaQuery.of(context).size.width * 1/9 + 16 , left: 4, bottom: 4, right: 4 ),
        margin: isDarkTheme ?
        EdgeInsets.only(top: 0.0 , left: 0, bottom: 0, right: 0 ) :
        EdgeInsets.only(top: 0.0 , left: 0, bottom: 0, right: 0 ),
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.black.withOpacity(0.5) : theme.primaryColor.withOpacity(opacity),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: child),
      ),
    );
  }
}
