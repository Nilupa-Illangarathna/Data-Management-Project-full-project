import 'package:intl/intl.dart';
import 'package:main_app/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import 'package:main_app/Classes/enams/enum.dart';
import 'package:main_app/Pages/HomePageModule/seeMorePage/see_more_screen.dart';
import 'package:main_app/Widgets/home_module/molecule_widgets/topic%20_with_blue_button.dart';
import '../../Classes/responsiveness/responsiveness.dart';
import '/API_Classes/preference_form/HotelRecommendationForm.dart';
import '/DartFilesForPages/PredictionPage/fitness_app_theme.dart';
import 'package:flutter/material.dart';
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
import '/Classes/theme/theme related/features_brightness.dart';
import '/Classes/theme/theme related/features_color.dart';
import '/Widgets/theme_container.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key? key, this.animationController, required this.isDarkTheme}) : super(key: key);
  final bool isDarkTheme;
  final AnimationController? animationController;
  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState(isDarkTheme: isDarkTheme);
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;

  jsonObj animationPath = RandomImageSelectorClass().HomeScreenClapmedJSONAnimationProvider() as jsonObj;

  // List<Widget> pages = [
  //   //Images carousels
  //   Center(
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           ImageCarousel(settings: settings1),
  //           ImageCarousel(settings: settings2),
  //           ImageCarousel(settings: positiveSummaries)
  //         ],
  //       ),
  //     ),
  //   ),
  //   Container(
  //     color: Colors.red,
  //   ),
  //   Container(
  //     color: Colors.green,
  //   ),
  //   Container(
  //     color: Colors.yellow,
  //   ),
  // ];

  _MyDiaryScreenState({Key? key, required this.isDarkTheme}) ;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  // Define the selectShopType function with an empty body
  void seeMorePlaces(bool isRecommendations) {
    //FIXME true means recommendations, false means visited places
    // final placeTypeProvider = Provider.of<HotelDataProvider>(context, listen: false);
    // placeTypeProvider.seeMoreRecommendations(isRecommendations);
    //this one is a null data to be passed
    HotelData data = HotelData(
        PlaceID: 0,
        LocationType: CustomPlaceType.cafe,
        isFavorite: false,
        isRecommended: "false",
        isVisited: "false",
        imageUrl: '',
        rating: '',
        name: '',
        address: '',
        location: '',
        reviews: '',
        food_grade: '',
        positiveSummary: "",
        negativeSummmary: '',
        longitude : 0.0,
        latitude : 0.0,
        positiveSentenceColumnSentiment: "",
        negativeSentenceColumnSentiment: "",
        positiveReview: "",
        reviewDateValues: "",
        reviewerScore: 0.0
    );
    _openBottomSheet(HomeScreenMBSFlags.seemore, data, isRecommendations);
  }

  //See more implementation
  void _openBottomSheet(HomeScreenMBSFlags modelBottomSheetName, HotelData data,
      bool isRecommendations) {
    Future.delayed(Duration(milliseconds: 450), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => SeeMoreScreen(
              hotelData: data, isRecommendation: isRecommendations),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Slide from right to left
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    });

  }
  late Color containerColor;

  @override
  void initState() {
    // containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);

    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData(); // You have to pass the correct arguments to this.

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() async{
    const int count = 9;

    ///////remove all these widgets and place the given widget tree which the root component is a Stack
    // listViews.add(
    //   Stack(
    //     children: [
    //       await Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(16.0),
    //             topRight: Radius.circular(16.0),
    //           ),
    //         ),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(16.0),
    //             topRight: Radius.circular(16.0),
    //           ),
    //           child: Lottie.asset(
    //             animationPath.address,
    //             fit: BoxFit.fitWidth,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    // listViews.add(
    //   await UserForm(),
    // );
    // listViews.add(
    //   SizedBox(
    //     height: 80,
    //   ),
    // );
    listViews.add(
      Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              await Container(
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
            ],
          ),
          await SingleChildScrollView(
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
                      SizedBox(
                        height: 12 * HR,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16 * WR, right: 16 * WR),
                        child: TopicWithBlueButton(
                          text1: "Suggested Places",
                          text2: "See More",
                          onPressed: () {
                            seeMorePlaces(true);
                            print('Item clicked: Recommended Places');
                          },
                        ),
                      ),
                      ThemeContainer(),

                      // HorizontalPageView(pages: pages),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // listViews.add(
    //   SizedBox(
    //     height: 80,
    //   ),
    // );
    // listViews.add(
    //   await Text("Fourth one"),
    // );
    // listViews.add(
    //   Container(
    //     decoration: BoxDecoration(
    //       color: Colors.red,
    //       borderRadius: BorderRadius.circular(16.0),
    //     ),
    //     padding: EdgeInsets.all(10.0),
    //     child: Container(
    //       height: 200,
    //       width: 100,
    //     ),
    //   ),
    // );
    // listViews.add(
    //   await Text("Fourth one"),
    // );
    // listViews.add(
    //   SizedBox(
    //     height: 80,
    //   ),
    // );
    // listViews.add(
    //   await Text("Fourth one"),
    // );
    // listViews.add(
    //   SizedBox(
    //     height: 80,
    //   ),
    // );
    // listViews.add(
    //   await Text("Fourth one"),
    // );
    // listViews.add(
    //   SizedBox(
    //     height: 80,
    //   ),
    // );
    // listViews.add(
    //   await Text("Fourth one"),
    // );
    // listViews.add(
    //   SizedBox(
    //     height: 80,
    //   ),
    // );
    // listViews.add(
    //   await Text("Fourth one"),
    // );
    // listViews.add(
    //   SizedBox(
    //     height: 80,
    //   ),
    // );
    // listViews.add(
    //   await Text("Fourth one"),
    // );
    // listViews.add(
    //   SizedBox(
    //     height: 80,
    //   ),
    // );
    // listViews.add(
    //   await Text("Fourth one"),
    // );
  }

  late Colors AppBarColor;



  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);

    // jsonObj animationPath = RandomImageSelectorClass().HomeScreenClapmedJSONAnimationProvider() as jsonObj;
    // List<Widget> pages = [
    //   //Images carousels
    //   Center(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           // ImageCarousel(settings: settings1),
    //           ImageCarousel(settings: settings2),
    //           ImageCarousel(settings: settings3)
    //         ],
    //       ),
    //     ),
    //   ),
    //   Container(
    //     color: Colors.red,
    //   ),
    //   Container(
    //     color: Colors.green,
    //   ),
    //   Container(
    //     color: Colors.yellow,
    //   ),
    // ];

    return Container(
      color: FitnessAppTheme.background, /////////////////// Background color
      child: Scaffold(
        backgroundColor: isDarkTheme? Colors.black.withOpacity(0.7) :theme.primaryColor.withOpacity(0.1),
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            // SizedBox(
            //   height: MediaQuery.of(context).padding.bottom,
            // )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            physics: ClampingScrollPhysics(),
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 0 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value -0.2), 0.0),
                child: Material(
                  elevation: 4 * topBarOpacity,
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkTheme? Colors.black.withOpacity(0.3 * topBarOpacity) :theme.primaryColor.withOpacity(0.6 * topBarOpacity),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: isDarkTheme? Colors.black.withOpacity(0.3 * topBarOpacity) :theme.primaryColor.withOpacity(0.3 * topBarOpacity), ///////////////////////////////// Scale down color
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 0.0),
                      ],

                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16 - 8.0 * topBarOpacity,
                              bottom: 19 - 8.0 * topBarOpacity),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Wonder Finder',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30 + 6 - 6 * topBarOpacity,
                                          letterSpacing: 1.2,
                                          color: FitnessAppTheme.darkerText, ///////////////////////////////////Text Color
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          FeaturesBrightness(),
                                          FeaturesColor(),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Center(
                                              child: Icon(
                                                Icons.keyboard_arrow_left,
                                                color: FitnessAppTheme.grey,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 8),
                                                      child: Icon(
                                                        Icons.calendar_today,
                                                        color: FitnessAppTheme.grey,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      DateFormat.yMMMd().format(DateTime.now()),
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily: FitnessAppTheme.fontName,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 15,
                                                        letterSpacing: -0.2,
                                                        color: FitnessAppTheme.darkerText,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Center(
                                              child: Icon(
                                                Icons.keyboard_arrow_right,
                                                color: FitnessAppTheme.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),






                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
