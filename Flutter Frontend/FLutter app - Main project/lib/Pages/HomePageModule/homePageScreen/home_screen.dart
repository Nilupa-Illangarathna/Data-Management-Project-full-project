import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:main_app/DartFilesForPages/Google_Map_Location_Widget/map_model_bottom_sheet.dart';
import '/DartFilesForPages/PredictionPage/fitness_app_theme.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/Classes/enams/enum.dart';
import '/API_Classes/global_applications/global_applications.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartData.dart';
import '/Pages/HomePageModule/cartScreen/cartModelBottomSheet.dart';
import '/Pages/HomePageModule/cartScreen/my_basket_screen.dart';
import '/Pages/HomePageModule/marketTypesScreen/market_types_screen.dart';
import '/Pages/HomePageModule/seeMorePage/see_more_screen.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';
import '/stateManagement/changeNotifiers/homePageModule/cart_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/homepage_data_notifier.dart';
import '/Widgets/home_module/molecule_widgets/most_used_item_card.dart';
import '/Pages/HomePageModule/ShopDetailsPage/shop_details_page.dart';
import '/API_Classes/HomeModuleRelated/homepageData/homepage_data.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import '/Widgets/home_module/atomic_widgets/banner_card.dart';
import '/Widgets/home_module/atomic_widgets/item_cart.dart';
import '/Widgets/home_module/atomic_widgets/search_bar.dart';
import '/Widgets/home_module/molecule_widgets/horizontal_recommendations_card_list_view.dart';
import '/Widgets/home_module/molecule_widgets/place_selector_horizontal_category_listview.dart';
import '/Widgets/home_module/molecule_widgets/topic%20_with_blue_button.dart';
import '/Widgets/home_module/molecule_widgets/visited_placed_listview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;

  //Provider
  List<CategoryItemData> placeTypesList = [];
  List<HotelData> recommendedPlacesList = [];
  List<HotelData> visitedPlacesList = [];
  @override
  void initState() {
    super.initState();

    // Use the provider to obtain the data
    final placeTypeProvider =
        Provider.of<CategoryDataProvider>(context, listen: false);
    final hotelProvider =
        Provider.of<HotelDataProvider>(context, listen: false);

    placeTypesList = placeTypeProvider.categoryItems;
    recommendedPlacesList = hotelProvider.recommendedPlaces;
    visitedPlacesList = hotelProvider.visitedPlaces;

    hotelProvider.initData(CustomPlaceType.club);
  }

  //FIXME variables
  var totalItemsOnCart = 0;
  final BannerURL = 'assets/images/image_banner.png';
  //most used/bought card related
  final imageAsset = 'assets/images/homeScreen/homeScreen/repeat.png';
  final title = "Iced Coffee";
  final subtitle = 'Central Café';
  final price = '10';
  // Searchbar
  final TextEditingController _searchController = TextEditingController();
  // Mic
  void performVoiceSearch() {
    print('Voice search activated');
  }

  // itemCart
  void openModalBottomSheet(BuildContext context) {
    handleCart();
    print('Item clicked: cart related openModalBottomSheet');
  }

  // Define the selectShopType function with an empty body
  void selectShopType(CategoryItemData item) {
    final placeTypeProvider =
        Provider.of<HotelDataProvider>(context, listen: false);
    placeTypeProvider.initData(item.categoryType);
    // _openMarketTypesScreen(item.categoryType);
  }


  void _openMarketTypesScreen(CustomPlaceType item) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MarketTypesScreen(item: item,),

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

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

  // Define the hotelSelectionFunction with an empty body
  void hotelSelectionFunction(HotelData data) {
    _openBottomSheet(HomeScreenMBSFlags.shopdetails, data, false);
    print('Selected Hotel: ${data.name}');
  }

  // Define the hotelSelectionFunction with an empty body
  void reorder() {
    PlaceCartData tempData = PlaceCartData(
      placeID: 3,
      placeName: "Central Cafe",
      location: "Colombo",
      subTotal: 10.00,
      numberOfCartItems: 1,
      newaddonsSet: [],
      cartItems: [
        Cart(
          hotelDetails: HotelData(
              PlaceID: 3,
              LocationType: CustomPlaceType.cafe,
              isFavorite: false,
              isRecommended: (random.nextBool() ? 'true' : 'false'),
              isVisited: (random.nextBool() ? 'true' : 'false'),
              imageUrl: currently_simulating
                  ? 'assets/images/homeScreen/homeScreen/places/cafes/cafe0${random.nextInt(number_of_available_images) + 1}.png'
                  : 'https://picsum.photos/700/700?random=0',
              rating: '4.2',
              name: 'Central Cafe',
              address: '34 Queens Rd, Colombo 00300',
              location: 'Colombo',
              reviews: '1K+',
              food_grade: 'A',
              positiveSummary: "Discover comfort and style at our urban retreat, Cityscape Hotel. Located in the heart of the city, our hotel offers modern accommodations and personalized service. Enjoy contemporary amenities, sleek design, and a central location that puts you at the center of it all. Whether you're here for business or leisure, make Cityscape Hotel your home away from home.",
              negativeSummmary: "Dated rooms, street noise, and indifferent staff. Needs improvements for a more comfortable experience. Won't be returning.",
              longitude : 0.0,
              latitude : 0.0,
              positiveSentenceColumnSentiment: "",
              negativeSentenceColumnSentiment: "",
              positiveReview: "",
              reviewDateValues: "",
              reviewerScore: 0.0
          ),

          totalAmount: 10.00,
          cartID: "id01",
          orderID: "odered01",
          numberOfItems: 1,
          productDetails: FoodItem(
              placeID: 1,
              foodID: 'coffee01',
              imagePath:
                  'assets/images/homeScreen/homeScreen/food_items/coffees/coffee03.png',
              title: 'Iced Coffee',
              price: 10.00,
              rating: 4.2,
              category: 'Coffee',
              description:
                  'Iced coffee is a cold version of your favourite coffee, but it\'s not simply a coffee that has been left to cool. Like a regular coffee\, it\'s usually a combination of hot espresso and milk. However, ice is added too.',
              extraAddons: {
                'Addon1': Addon(addonName: 'Extra Sugar', addonPrice: 0.00),
                'Addon2': Addon(addonName: 'Whipped Cream', addonPrice: 0.50),
                'Addon3': Addon(addonName: 'Chocolate Syrup', addonPrice: 1.00),
                'Addon4':
                    Addon(addonName: 'Chocolate Drizzle', addonPrice: 0.60),
                'Addon3': Addon(addonName: 'Extra Ice', addonPrice: 0.10),
              }),
          addonsSet: {
            'Addon1': Addon(
                addonName: 'Extra Sugar', addonPrice: 0.00, isAdded: false),
            'Addon2': Addon(
                addonName: 'Whipped Cream', addonPrice: 0.50, isAdded: true),
            'Addon3': Addon(
                addonName: 'Chocolate Syrup', addonPrice: 1.00, isAdded: true),
            'Addon4': Addon(
                addonName: 'Chocolate Drizzle',
                addonPrice: 0.60,
                isAdded: false),
          },
        )
      ],
    );

    //
    //     // I/flutter (10629): Place ID: 3
    // // I/flutter (10629): Place Name: Bake House
    // // I/flutter (10629): Location: Colombo
    // // I/flutter (10629): Sub Total: 10.60
    // // I/flutter (10629): Number of Cart Items: 0
    // I/flutter (10629): Cart Items:
    // I/flutter (10629):   - Addon Name: Addon1
    // I/flutter (10629):   - Addon Price: 0.0
    // I/flutter (10629):   - Is Added: true
    // I/flutter (10629):   - Addon Name: Addon2
    // I/flutter (10629):   - Addon Price: 0.5
    // I/flutter (10629):   - Is Added: true
    // I/flutter (10629):   - Addon Name: Addon3
    // I/flutter (10629):   - Addon Price: 0.1
    // I/flutter (10629):   - Is Added: true
    // I/flutter (10629):   - Addon Name: Addon4
    // I/flutter (10629):   - Addon Price: 0.6
    // I/flutter (10629):   - Is Added: false
    // I/flutter (10629): =================================
    // I/flutter (10629): state istrue
    // I/chatty  (10629): uid=10122(com.newnop.kyosync) 1.ui identical 1 line
    // I/flutter (10629): state istrue
    // I/flutter (10629): state isfalse
    //

    print('Reordered');
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CartDetailsPage(
                onClose: () {
                  Navigator.of(context).pop();
                },
                cartData: tempData),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  //handle cart click
  void handleCart() {
    print(MediaQuery.of(context).viewInsets.bottom);
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true, // Ensure the sheet can be scrolled
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom == 0
                ? 360 * HR
                : MediaQuery.of(context).viewInsets.bottom + 360 * HR,
            child: Scaffold(
              body: CartModelBottomSheet(
                onClose: () {
                  // Define what should happen when the bottom sheet is closed TODO
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  //See more implementation
  void _openBottomSheet(HomeScreenMBSFlags modelBottomSheetName, HotelData data,
      bool isRecommendations) {
    Future.delayed(Duration(milliseconds: 450), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          modelBottomSheetName == HomeScreenMBSFlags.seemore
              ? SeeMoreScreen(
              hotelData: data, isRecommendation: isRecommendations)
              :
          // ShopDetailsPage(hotelData: data),
          // FoodsInitializationScreen(hotelData: data),
          ShopDetailsPage(hotelData: data),
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

  @override
  void dispose() {
    super.dispose();
  }

  late Color containerColor;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);
    // Use the provider to obtain the data
    final placeTypeProvider =
    Provider.of<CategoryDataProvider>(context, listen: false);
    final hotelProvider =
    Provider.of<HotelDataProvider>(context, listen: false);

    placeTypesList = placeTypeProvider.categoryItems;
    recommendedPlacesList = hotelProvider.recommendedPlaces;
    visitedPlacesList = hotelProvider.visitedPlaces;
    hotelProvider.initData(CustomPlaceType.club);

    return Container(
      color: FitnessAppTheme.background, /////////////////// Background color
      child: Scaffold(
        backgroundColor: isDarkTheme? Colors.black.withOpacity(0.7) :theme.primaryColor.withOpacity(0.1),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(children: [
            SizedBox(height: 19 * HR),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * HR),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * (1/3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Travel Buddy',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FitnessAppTheme.fontName,
                          fontWeight: FontWeight.w700,
                          fontSize: 30 + 6 - 6 * 0,
                          letterSpacing: 1.2,
                          color: isDarkTheme ? Colors.grey : Colors.grey.shade900, ///////////////////////////////////Text Color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8 * WR,
                  ),
                  Consumer<CartDataProvider>(
                    builder: (context, CartDataProvider, child) {
                      return ItemCart(
                        imagePath: CartDataProvider.CartListItems.length > 1
                            ? 'assets/images/homeScreen/homeScreen/multicarts.png'
                            : 'assets/images/homeScreen/homeScreen/cart.png', // Replace with your image path
                        number: CartDataProvider.CartListItems.length,
                        onClick: () => openModalBottomSheet(context),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12 * HR,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16  * WR),
            //   child: MostOrderedCard(
            //     imageAsset: imageAsset,
            //     title: title,
            //     price: price,
            //     subtitle: subtitle,
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     reorder();
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16 * WR),
            //     child: MostOrderedCard(
            //       imageAsset: imageAsset,
            //       title: title,
            //       price: price,
            //       subtitle: subtitle,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 12 * HR,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16 * WR),
            //   child: BannerCard(
            //     imagePath: BannerURL, // Replace with your image path
            //   ),
            // ),
            // SizedBox(
            //   height: 20 * HR,
            // ),
            Consumer<CategoryDataProvider>(
              builder: (context, PlaceTypeProvider, child) {
                return Padding(
                  padding: EdgeInsets.only(left: 16 * WR),
                  child: PlaceSelectorHorizontalListview(
                    items: PlaceTypeProvider.categoryItems,
                    onItemClick: (item) {
                      selectShopType(item); // Call the selectShopType function
                      print('Item clicked: ${item.categoryName}');
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 12 * HR,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16 * WR, right: 16 * WR),
              child: TopicWithBlueButton(
                text1: "Recommended Places",
                text2: "See More",
                onPressed: () {
                  seeMorePlaces(true);
                  print('Item clicked: Recommended Places');
                },
              ),
            ),

            Consumer<HotelDataProvider>(
              builder: (context, hotelProvider, child) {
                return Padding(
                  padding: EdgeInsets.only(left: 16 * WR),
                  child: HorizontalHotelListView(
                    items: hotelProvider.recommendedPlaces,
                    onItemClick: (item) {
                      hotelSelectionFunction(
                          item); // Call the hotelSelectionFunction
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 12 * HR,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16 * WR, right: 16 * WR),
              child: TopicWithBlueButton(
                text1: "Visited Places",
                text2: "See More",
                onPressed: () {
                  seeMorePlaces(false);
                  print('Item clicked: Recommended Places');
                },
              ),
            ),
            Container(
              constraints:
                  BoxConstraints(maxHeight: 400 * HR), // Set the maximum height
              child: Consumer<HotelDataProvider>(
                builder: (context, hotelProvider, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16 * WR),
                    child: VisitedPlaceListView(
                      data: hotelProvider
                          .visitedPlaces, // Pass your data array here
                      onItemClick: (item) {
                        hotelSelectionFunction(
                            item); // Call the hotelSelectionFunction
                      },
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
