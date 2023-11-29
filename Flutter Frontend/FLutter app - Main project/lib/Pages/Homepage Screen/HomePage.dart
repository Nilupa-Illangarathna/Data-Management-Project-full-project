import 'package:flutter/material.dart';
import 'package:main_app/Pages/WonderlustWordsmith/wonderlust_wordsmit.dart';
import '/Pages/HomePageModule/homePageScreen/home_screen.dart';
import '/Classes/theme/theme related/features_brightness.dart';
import '/Classes/theme/theme related/features_color.dart';
import '/Classes/theme/theme related/keep_alive.dart';
import '/Widgets/HomePagesContainer/PageContainer.dart';

import '/Classes/random_image_selector.dart';
// import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import '/DartFilesForPages/ImageCarousel/Image_carousel.dart';
import '/API_Classes/Positive_Negative_Corausal/customizer_data_instance.dart';
import '/DartFilesForPages/Google_Map_Location_Widget/googleMapLocation.dart';
import 'dart:math';
import '/API_Classes/googleMapData/google_map_data.dart';
import '/Classes/colors.dart';
import '/Pages/Home Level Screens/homescreen_tab.dart';
import '/DartFilesForPages/PredictionPage/PredictorPage.dart';

final GoogleMapDataObj = GoogleMapData();

double randomLocation() {
  Random random = Random();
  double min = -90.0;
  double max = 90.0;
  double randomDouble = min + random.nextDouble() * (max - min);
  return randomDouble;
}

List<Widget> pages = [
  //Images carousels
  Center(
      child: SingleChildScrollView(
    child: Column(
      children: [
        // SizedBox(height: 50,),
        ImageCarousel(settings: settings1),
        ImageCarousel(settings: settings2),
        ImageCarousel(settings: positiveSummaries)
      ],
    ),
  )),
  Container(
    color: Colors.red,
    child: GoogleMapLocation(
      locationArr: GoogleMapDataObj.Location_Coordinates, // Example coordinates
      // locationArr: [randomLocation(), randomLocation()], // Example coordinates
      apiKey: GoogleMapDataObj.API_key,
    ),
  ),
  Container(
    color: Colors.green,
  ),
  Container(
    color: Colors.yellow,
  ),
];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;

    // String address = RandomImageSelectorClass().HomeScreenClapmedImageProvider();

    jsonObj animationPath = RandomImageSelectorClass()
        .HomeScreenClapmedJSONAnimationProvider() as jsonObj;

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        // backgroundColor: isDarkTheme? Colors.black.withOpacity(0.5) :theme.primaryColor.withOpacity(0.2),
        body: Stack(
          children: [
            TabBarView(
              children: [
                // KeepAliveWidget(
                //   // child: FeaturesOption(),
                //   child: PageContainer(
                //     child: HomePageTab(isDarkTheme: isDarkTheme,),
                //     isDarkTheme: isDarkTheme, // Replace with your theme settings
                //     theme: ThemeData(primaryColor: isDarkTheme? Colors.black.withOpacity(0.5) :theme.primaryColor.withOpacity(0.4),), // Replace with your theme data
                //     opacity: 0.1,
                //   ),
                // ),

                KeepAliveWidget(
                  // child: FeaturesOption(),
                  child: PageContainer(
                    child: PredictorPage(), // Replace with your content widget
                    isDarkTheme:
                        isDarkTheme, // Replace with your theme settings
                    theme: ThemeData(
                        primaryColor: isDarkTheme
                            ? Colors.black.withOpacity(0.3)
                            : theme.primaryColor.withOpacity(
                                0.6)), // Replace with your theme data
                    opacity: 0.1,
                  ),
                ),

                KeepAliveWidget(
                  // child: FeaturesOption(),
                  child: PageContainer(
                    child: HomeScreen(),

                    // Replace with your content widget
                    isDarkTheme:
                        isDarkTheme, // Replace with your theme settings
                    theme: ThemeData(
                      primaryColor: isDarkTheme
                          ? Colors.black.withOpacity(0.5)
                          : theme.primaryColor.withOpacity(0.2),
                    ), // Replace with your theme data
                    opacity: 0.0,
                  ),
                ),

                // KeepAliveWidget(
                //   // child: FeaturesOption(),
                //   child: PageContainer(
                //     child: Container(
                //       height: 300,
                //       width: 300,
                //       decoration: BoxDecoration(
                //         color: Colors.transparent,
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //       child: GoogleMapLocation(
                //         locationArr: GoogleMapDataObj.Location_Coordinates, // Example coordinates
                //         // locationArr: [randomLocation(), randomLocation()], // Example coordinates
                //         apiKey: GoogleMapDataObj.API_key,
                //       ),
                //     ),
                //     isDarkTheme: isDarkTheme, // Replace with your theme settings
                //     theme: ThemeData(primaryColor: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.2)), // Replace with your theme data
                //     opacity: 0.1,
                //   ),
                // ),

                KeepAliveWidget(
                  child: WanderlustWordforgeScreen(),
                ),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.all(0.0),
            //   child: Material(
            //     elevation: 1,
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(40),
            //       bottomRight: Radius.circular(8),
            //       topRight: Radius.circular(8),
            //       topLeft: Radius.circular(8)
            //     ),
            //     color: Colors.transparent,
            //     child: Container(
            //       height: MediaQuery.of(context).size.width * 4/27,
            //       width: double.infinity,
            //       decoration: BoxDecoration(
            //         color: isDarkTheme? Colors.black.withOpacity(0.5) :theme.primaryColor.withOpacity(0.5),
            //         borderRadius: BorderRadius.only(
            //             bottomLeft: Radius.circular(40),
            //             bottomRight: Radius.circular(8),
            //             topRight: Radius.circular(8),
            //             topLeft: Radius.circular(8)
            //         ),
            //
            //         boxShadow: [
            //           // BoxShadow(
            //           //   // color: Colors.black,
            //           //   blurRadius: 0,
            //           //   offset: Offset(0, -2), // Adjust the values for desired shadow direction
            //           // ),
            //         ],
            //       ),
            //       // color: Colors.black54.withOpacity(0.4),
            //       //   color: !isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.8),
            //
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //               FeaturesBrightness(),
            //               FeaturesColor(),
            //         ],
            //       ),
            //
            //
            //       // AppBar(
            //       //   // backgroundColor: theme.primaryColor.withOpacity(0.8),
            //       //   // backgroundColor: theme.primaryColor.withOpacity(1),
            //       //   // title: Text('SmartSelect'),
            //       //   // bottom: TabBar(
            //       //   //   isScrollable: true,
            //       //   //   indicatorColor: Colors.white,
            //       //   //   indicatorSize: TabBarIndicatorSize.label,
            //       //   //   tabs: [
            //       //   //     Tab(text: 'Page01 Scaffold'),
            //       //   //     Tab(text: 'Page02 Scaffold'),
            //       //   //     Tab(text: 'Page03 Scaffold'),
            //       //   //     Tab(text: 'Page04 Scaffold'),
            //       //   //     Tab(text: 'Page05 Scaffold'),
            //       //   //     Tab(text: 'Page06 Scaffold'),
            //       //   //   ],
            //       //   // ),
            //       //   actions: <Widget>[
            //       //     FeaturesBrightness(),
            //       //     FeaturesColor(),
            //       //   ],
            //       //   // backgroundColor: isDarkTheme? Colors.black.withOpacity(0.5) :theme.primaryColor.withOpacity(0.6),
            //       //   backgroundColor: Colors.transparent,
            //       //   elevation: 8,
            //       // ),
            //     ),
            //   ),
            // ),
          ],
        ),
        // bottomNavigationBar: Card(
        //   elevation: 3,
        //   margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        //   child: FeaturesTheme(),
        // ),
      ),
    );
  }
}
