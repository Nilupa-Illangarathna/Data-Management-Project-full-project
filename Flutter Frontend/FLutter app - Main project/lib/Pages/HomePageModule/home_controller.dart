import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import 'homePageScreen/home_screen.dart';
import '../Home/bookings_screen.dart';
import '../Home/mypage_screen.dart';
import '../Home/wishlist_screen.dart';
import '/Classes/enams/enum.dart';
import '/stateManagement/changeNotifiers/homePageModule/homepage_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import 'package:provider/provider.dart';



class HomeController extends StatefulWidget {
  final int index;

  const HomeController({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController>
    with WidgetsBindingObserver {
  int currentIndex = 0;
  late PageController _pageController;
  var isLoading = true;

  @override
  void initState() {
    _initializeData();
    currentIndex = widget.index < 0
        ? 0
        : widget.index > 4
            ? 4
            : widget.index;
    _pageController = PageController(initialPage: currentIndex);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  Future<void> _initializeData() async {
    // Simulate a 5-second delay (you can replace this with actual API calls)
    await Future.delayed(Duration(seconds: 2));
    // TODO initial API request shouldm be done inside this.
    // Here you can check if data is successfully fetched, and if so, navigate to HomeController.
    // For example, if both CategoryDataProvider and HotelDataProvider are initialized:
    final categoryProvider =  Provider.of<CategoryDataProvider>(context, listen: false);
    final hotelProvider =  Provider.of<HotelDataProvider>(context, listen: false);

    //init data using api call
    await hotelProvider.initData(CustomPlaceType.all);




    if (categoryProvider.isInitialized && hotelProvider.isInitialized) {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => HomeController(index: 0), // or provide your initial index
      //   ),
      // );
      setState(() {
        isLoading= false;
      });
    }
  }



  @override
  void dispose() {
    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomeController oldWidget) {
    if (oldWidget.index != widget.index) {
      _pageController.jumpToPage(widget.index);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent the screen from being popped
        return false;
      },
      child:       isLoading?
      Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // You can customize the loading widget
        ),
      ):
      Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: const [
            HomeScreen(),
            WishlistScreen(),
            BookingsScreen(),
            MyPageScreen()
          ],
        ),
        bottomNavigationBar: Container(
          height: 100 * HR,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            elevation: 1,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor:
            Theme.of(context).colorScheme.onBackground,
            backgroundColor: Colors.white.withOpacity(0.9),
            unselectedLabelStyle:  TextStyle(
              fontSize: 10 * HR,
            ),
            selectedLabelStyle:  TextStyle(
              fontSize: 10 * HR,
            ),
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
            items:  [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    size: 26 * HR,
                  ),
                  activeIcon: Icon(
                    Icons.home_filled,
                    size: 26 * HR,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 26 * HR,
                  ),
                  activeIcon: Icon(
                    Icons.favorite,
                    size: 26 * HR,
                  ),
                  label: "Wish List"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_border,
                    size: 26 * HR,
                  ),
                  activeIcon: Icon(
                    Icons.bookmark,
                    size: 26 * HR,
                  ),
                  label: "Bookings"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    size: 26 * HR,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    size: 26 * HR,
                  ),
                  label: "My Page"),
            ],
          ),
        ),
      ),
    );
  }
}
