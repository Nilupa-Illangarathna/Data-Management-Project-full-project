import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import '/Classes/random_image_selector.dart';
import '/DartFilesForPages/Google_Map_Location_Widget/googleMapLocation.dart';
import '/Widgets/Horizontal_Page_View_Widget/HorizontalPageView.dart';
import '/DartFilesForPages/Forms/page01_user_input_form.dart';
import '/Classes/colors.dart';
import '/DartFilesForPages/ImageCarousel/Image_carousel.dart';
import '/API_Classes/Positive_Negative_Corausal/customizer_data_instance.dart';

class HomePageTab extends StatelessWidget {
  final bool isDarkTheme;

  const HomePageTab({Key? key, required this.isDarkTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    jsonObj animationPath = RandomImageSelectorClass().HomeScreenClapmedJSONAnimationProvider() as jsonObj;

    List<Widget> pages = [
      //Images carousels
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageCarousel(settings: settings1),
              ImageCarousel(settings: settings2),
              ImageCarousel(settings: positiveSummaries)
            ],
          ),
        ),
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.yellow,
      ),
    ];

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Lottie.asset(
              animationPath.address,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 2 - 50,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius:
                    BorderRadius.only(topRight: Radius.circular(22.0), topLeft: Radius.circular(22.0))),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 3 / 100),
                      child: UserForm(),
                    ),
                    HorizontalPageView(pages: pages),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
