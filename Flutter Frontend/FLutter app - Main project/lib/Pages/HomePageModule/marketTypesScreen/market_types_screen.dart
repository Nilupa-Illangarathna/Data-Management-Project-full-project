import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/enams/enum.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/Pages/HomePageModule/homePageScreen/home_screen.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/Pages/HomePageModule/home_controller.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/shop_items_data_notifier.dart';
import '/Widgets/common/common_blue_themed_submit_button.dart';
import '/Widgets/home_module/atomic_widgets/search_bar.dart';
import '/Widgets/home_module/molecule_widgets/cafe_header_card.dart';
import '/Widgets/home_module/molecule_widgets/food_type_selector_horizontal_listview.dart';
import '/Widgets/home_module/molecule_widgets/foods_listview.dart';
import '/Widgets/home_module/molecule_widgets/review_section.dart';
import '/Widgets/home_module/molecule_widgets/shop_data_tile.dart';
import 'package:provider/provider.dart';

class MarketTypesScreen extends StatefulWidget {
  final CustomPlaceType item; // Add this line

  MarketTypesScreen({required this.item}); // Add this constructor

  @override
  _MarketTypesScreenState createState() => _MarketTypesScreenState();
}

class _MarketTypesScreenState extends State<MarketTypesScreen> {
  // TODO CreateUser Api start

  // TODO CreateUser Api end

  var isLoading = true;

  @override
  void initState() {
    super.initState();

    _initializeData();

    final InsideShopDataProvider = Provider.of<InsideShopDataNotifier>(context, listen: false);

    FoodTypeSelector selectedFoodType = InsideShopDataProvider.selectedFoodType;
    List<FoodItem> recommendedPlacesList = InsideShopDataProvider.selected_food_items;

    final foodItemManager = FoodItemManager(recommendedPlacesList);

    final filteredAndRandomizedItems = foodItemManager.filterAndRandomizeCategory(selectedFoodType.category, 9);
    InsideShopDataProvider.setCurrent(filteredAndRandomizedItems);
  }

  Future<void> _initializeData() async {
    await Future.delayed(Duration(milliseconds: 500));  //TODO this represents the delay of the API call
    // TODO initial API request shouldm be done inside this.

    final foodsProvider =  Provider.of<InsideShopDataNotifier>(context, listen: false);

    //init data using api call
    // await foodsProvider.initData(widget.item);

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
    return isLoading?
    Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // You can customize the loading widget
      ),
    ):
    Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16  * HR),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).push(
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
                      child: Stack(
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xFF007AFF),
                              ),
                              SizedBox(width: 4.0  * WR),
                              Text(
                                // "Login",
                                tr('homePlaceItem.back', context: context),
                                style: TextStyle(
                                  fontFamily: "SF Pro Text",
                                  fontSize: 17.0  * HR,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.408  * WR,
                                  color: Color(0xFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              widget.item.name,
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 18 * HR,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.4 * WR,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 12  * HR,
                  ),

                  Consumer<HotelDataProvider>(
                    builder: (context, hotelProvider, child) {
                      return Padding(
                        padding:  EdgeInsets.only(left: 16.0 * WR),
                        child: Row(
                          children: [
                            Text(
                              '${hotelProvider.visitedPlaces.length} ' + tr('homeSeeMore.results', context: context),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 13.0 * HR,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.4 * WR,
                                height: 18.0 * HR / 13.0, // line height divided by font size

                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),


                  // Padding(
                  //   padding:  EdgeInsets.only(left: 16.0 * WR),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         '${hotelProvider.visitedPlaces.length} ' + tr('homeSeeMore.results', context: context),
                  //         textAlign: TextAlign.left,
                  //         style: TextStyle(
                  //           fontFamily: 'SF Pro',
                  //           fontSize: 13.0 * HR,
                  //           fontWeight: FontWeight.w400,
                  //           letterSpacing: -0.4 * WR,
                  //           height: 18.0 * HR / 13.0, // line height divided by font size
                  //
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 16  * HR,
                  ),

                  Container(
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height- 176 * HR),
                    child: Consumer<HotelDataProvider>(
                      builder: (context, hotelProvider, child) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16 * WR),
                          child: ListView.separated(
                            itemCount: hotelProvider.visitedPlaces.length,
                            separatorBuilder: (context, index) => SizedBox(height: 16 * HR), // Add this line to specify the gap
                            itemBuilder: (context, index) {
                              final item = hotelProvider.visitedPlaces[index];
                              return hotelProvider.visitedPlaces.length-1== index?

                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        RestaurantItem(
                                          item: item,
                                          name: item.name,
                                          address: item.address,
                                          imagePath: item.imageUrl,
                                          favourite: 'assets/favourite.png',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16 * HR,),
                                  ],
                                ),
                              )

                                  : RestaurantItem(
                                item: item,
                                name: item.name,
                                address: item.address,
                                imagePath: item.imageUrl,
                                favourite: 'assets/favourite.png',
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0 * WR),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 56 * HR,
                      child: MainBlueSubmitButton(
                        height: 56 * HR,
                        text: tr('homeSeeMore.see_more', context: context),
                        onPressed: () {},
                        inProgress: false,
                      ),
                    ),
                  ),
                  // SizedBox(height: 100 * HR,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}