import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:main_app/DartFilesForPages/Google_Map_Location_Widget/map_model_bottom_sheet.dart';
import 'package:main_app/DartFilesForPages/ImageCarousel/Image_carousel.dart';
import 'package:main_app/API_Classes/Positive_Negative_Corausal/customizer_data_instance.dart';
import 'package:main_app/Pages/Homepage%20Screen/HomePage.dart';
import 'package:main_app/Widgets/Horizontal_Page_View_Widget/HorizontalPageView.dart';
import 'package:main_app/Widgets/home_module/atomic_widgets/custom_passage.dart';
import 'package:main_app/Widgets/home_module/atomic_widgets/text_passage.dart';
import 'package:main_app/Widgets/home_module/molecule_widgets/ReviewSummary.dart';
import '../../LoadingScreen/loading_screen.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/Pages/HomePageModule/homePageScreen/home_screen.dart';
import 'package:main_app/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/Pages/HomePageModule/home_controller.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/shop_items_data_notifier.dart';
import '/Widgets/home_module/atomic_widgets/search_bar.dart';
import '/Widgets/home_module/molecule_widgets/cafe_header_card.dart';
import '/Widgets/home_module/molecule_widgets/food_type_selector_horizontal_listview.dart';
import '/Widgets/home_module/molecule_widgets/foods_listview.dart';
import '/Widgets/home_module/molecule_widgets/review_section.dart';
import 'package:provider/provider.dart';

class ShopDetailsPage extends StatefulWidget {
  final HotelData hotelData; // Add this line

  ShopDetailsPage({required this.hotelData}); // Add this constructor

  @override
  _ShopDetailsPageState createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {

  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  // TODO CreateUser Api start

  // TODO CreateUser Api end

  var isLoading = true;

  @override
  void initState() {
    super.initState();

    _initializeData();

    // Use the provider to obtain the data
    final InsideShopDataProvider = Provider.of<InsideShopDataNotifier>(context, listen: false);

    FoodTypeSelector selectedFoodType = InsideShopDataProvider.selectedFoodType;
    List<FoodItem> recommendedPlacesList = InsideShopDataProvider.selected_food_items;

    final foodItemManager = FoodItemManager(recommendedPlacesList);

    final filteredAndRandomizedItems = foodItemManager.filterAndRandomizeCategory(selectedFoodType.category, 9);
    InsideShopDataProvider.setCurrent(filteredAndRandomizedItems);
  }

  Future<void> _initializeData() async {
    // Simulate a 5-second delay (you can replace this with actual API calls)
    await Future.delayed(Duration(milliseconds: 3000));  //TODO this represents the delay of the API call
    // TODO initial API request shouldm be done inside this.
    // Here you can check if data is successfully fetched, and if so, navigate to HomeController.
    // For example, if both CategoryDataProvider and HotelDataProvider are initialized:
    final foodsProvider =  Provider.of<InsideShopDataNotifier>(context, listen: false);

    //init data using api call
    await foodsProvider.initData(widget.hotelData);

    if (foodsProvider.isInitialized) {
      setState(() {
        isLoading= false;
      });
    }
  }


  // Searchbar
  final TextEditingController _searchController = TextEditingController();
  // Mic
  void performVoiceSearch() {
    // Implement the voice input functionality here
    print('Voice search activated');
  }

  bool isFavorite = false;

  void onFavoritePressed(bool newFavoriteState) {
    setState(() {
      isFavorite = newFavoriteState;

    });
  }
  void onNavigationPressed() {
    // Implement the navigation logic here
    print('Navigation button pressed');
  }

  // Function to call this widget
  void showGoogleMapBottomSheet(BuildContext context, String apiKey, List<double> locationArr) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,

      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return GoogleMapBottomSheet(
          apiKey: apiKey,
          locationArr: locationArr,
        );
      },
    );
  }

  void onFoodTypeItemSelected(FoodTypeSelector item) {

    // Use the provider to obtain the data
    final InsideShopDataProvider = Provider.of<InsideShopDataNotifier>(context, listen: false);

    InsideShopDataProvider.initCategoryData(item);
    print("Selected: ${item.category}");
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //
  //
  //     // Add your logic to process the data here
  //     if(true){
  //       //   TODO add the conditions based on the backend operations
  //       Navigator.of(context).pushReplacement(
  //         PageRouteBuilder(
  //           pageBuilder: (context, animation, secondaryAnimation) => TermsPage(),
  //           transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //             const begin = Offset(1.0, 0.0); // Slide from right to left
  //             const end = Offset.zero;
  //             var tween = Tween(begin: begin, end: end);
  //             var offsetAnimation = animation.drive(tween);
  //             return SlideTransition(position: offsetAnimation, child: child);
  //           },
  //         ),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);

    return isLoading?
    LoadingScreen():
      Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: Container(
        color: containerColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16  * HR),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.of(context).pop(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    HomeController(index: 0,),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin =
                              Offset(1.0, 0.0); // Slide from right to left
                              const end = Offset.zero;
                              var tween = Tween(begin: begin, end: end);
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                  position: offsetAnimation, child: child);
                            },
                            transitionDuration:
                            const Duration(milliseconds: 50),
                          ),
                        );




                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent, // No background
                        padding: EdgeInsets.all(0), // No extra padding
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.0 * WR),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: isDarkTheme? Colors.white.withOpacity(0.3) :theme.primaryColor,
                            ),
                            SizedBox(width: 4.0  * WR),
                            Text(
                              // "Login",
                              "Back",
                              style: TextStyle(
                                fontFamily: "SF Pro Text",
                                fontSize: 17.0  * HR,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.408  * WR,
                                color: isDarkTheme? Colors.white.withOpacity(0.3) :theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8  * HR),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.0 * WR),
                      child: Row(
                        children: [
                          VoiceSearchBar(
                            controller: _searchController,
                            onSearch: performVoiceSearch,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16  * HR), // Adjust as needed
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.0 * WR),
                      child: Container(
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        child: Column(
                          children: [


                            Consumer<HotelDataProvider>(
                              builder: (context, PlaceProvider, child) {
                                HotelData item = PlaceProvider.getPlaceByID(widget.hotelData.PlaceID);
                                return Container(
                                  height: 166  * HR,
                                  color: Colors.transparent,
                                  child: CafeHeaderCard(
                                    placeID:item.PlaceID,
                                    imagePath: item.imageUrl,
                                    location: item.address + " " + item.location,
                                    title: limitTextWithEllipsis(item.name,14),
                                    isFavorite: item.isFavorite, // Initial favorite state
                                    onFavoritePressed: (bool isFavoriteState) {
                                      PlaceProvider.notifyListenersUpdated();
                                    },
                                    onNavigationPressed: () {
                                      // TODO Handle navigation button press here

                                      showGoogleMapBottomSheet(

                                        context, // Example coordinates
                                        // locationArr: [randomLocation(), randomLocation()], // Example coordinates
                                        GoogleMapDataObj.API_key,
                                        [widget.hotelData.longitude,widget.hotelData.latitude],
                                      );
                                      print('Navigation button pressed');
                                    },
                                  ),
                                );

                              },
                            ),

                            Container(
                              color: Colors.transparent,
                              child: Padding(
                                padding:  EdgeInsets.only(top: 16  * HR,left: 20  * WR, right: 20  * WR, bottom: 16  * HR),
                                child: RatingsSection(
                                  Food_Grade: widget.hotelData.food_grade,
                                  Rating: widget.hotelData.rating,
                                  Reviews: widget.hotelData.reviews,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 8 * HR,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 0.0 *WR, right: 0.0 *WR),
                      child: ReviewSummaryView(pages:
                      [
                        //Images carousels
                        Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextPassage(
                                            text: "Positive summary",
                                            fontWeight: FontWeight.w600,
                                            alignment: TextAlign.left,
                                            fontSize: 20 * HR,
                                            fontColor: isDarkTheme? theme.primaryColor.withOpacity(0.3) :theme.primaryColor.withOpacity(0.7),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8 * HR,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(0),
                                        child: CustomPassage(
                                          text: widget.hotelData.positiveSummary,
                                          fontWeight: FontWeight.w500,
                                          fontColor: isDarkTheme? theme.primaryColor.withOpacity(0.3) :theme.primaryColor.withOpacity(0.3),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 24 * HR,
                                      // ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0.0 *WR),
                                  child: ImageCarousel(settings: positiveSummaries),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextPassage(
                                            text: "Negative summary",
                                            fontWeight: FontWeight.w600,
                                            alignment: TextAlign.left,
                                            fontSize: 20 * HR,
                                            fontColor: isDarkTheme? theme.primaryColor.withOpacity(0.3) :theme.primaryColor.withOpacity(0.7),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8 * HR,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(0),
                                        child: CustomPassage(
                                          text: widget.hotelData.negativeSummmary,
                                          fontWeight: FontWeight.w500,
                                          fontColor: isDarkTheme? theme.primaryColor.withOpacity(0.3) :theme.primaryColor.withOpacity(0.3),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 24 * HR,
                                      // ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0.0 *WR),
                                  child: ImageCarousel(settings: negativeSummaries),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                      ),
                    ),


                    SizedBox(
                      height: 12  * HR,
                    ),
                    Consumer<InsideShopDataNotifier>(
                      builder: (context, InsideShopDataProvider, child) {
                          return Padding(
                            padding:  EdgeInsets.only(left: 16.0 * WR),
                            child: FoodTypeSelectorHorizontalListview(
                            items: InsideShopDataProvider.all_current_food_types,
                            onItemClick: onFoodTypeItemSelected,
                          ),
                        );


                      },
                    ),
                    SizedBox(
                      height: 16  * HR,
                    ),
                    Consumer<InsideShopDataNotifier>(
                      builder: (context, InsideShopDataProvider, child) {
                        return ProductTileList(
                            products: InsideShopDataProvider.selected_food_items,
                          hotelData: widget.hotelData,
                        );
                      },
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


