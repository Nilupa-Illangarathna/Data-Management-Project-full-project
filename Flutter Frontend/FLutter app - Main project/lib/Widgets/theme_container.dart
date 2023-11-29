import 'package:flutter/material.dart';
import '../../DartFilesForPages/ImageCarousel/Image_carousel.dart';
import '../API_Classes/Positive_Negative_Corausal/customizer_data_instance.dart';
import '../Classes/theme/theme.dart';
class ThemeContainer extends StatefulWidget {
  const ThemeContainer({Key? key}) : super(key: key);

  @override
  _ThemeContainerState createState() => _ThemeContainerState();
}

class _ThemeContainerState extends State<ThemeContainer> {

  ThemeData get theme => Theme.of(context);
  late Color containerColor;
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {

    isDarkTheme = theme.brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);

    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      // height: 100,
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            ImageCarousel(settings: settings1),
            ImageCarousel(settings: settings2),
          ],
        ),
      ),
    );
  }
}
