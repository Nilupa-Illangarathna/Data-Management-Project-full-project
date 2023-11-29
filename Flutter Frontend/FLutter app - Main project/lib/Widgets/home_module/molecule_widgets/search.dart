import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Pages/HomePageModule/homePageScreen/home_screen.dart';
import '/Pages/HomePageModule/home_controller.dart';



class Cafe {
  String imagePath;
  String cafeName;
  Cafe({required this.imagePath, required this.cafeName});
}

class TopCategoriesSearch extends StatefulWidget {
  @override
  _TopCategoriesSearchState createState() => _TopCategoriesSearchState();
}

class _TopCategoriesSearchState extends State<TopCategoriesSearch> {
  List<Cafe> cafesListd = [
    Cafe(imagePath: "assets/images/homeScreen/homeScreen/search/cafes.png", cafeName: "Cafés"),
    Cafe(imagePath: "assets/images/homeScreen/homeScreen/search/restaurants.png", cafeName: "Restaurants"),
    Cafe(imagePath: "assets/images/homeScreen/homeScreen/search/clubs.png", cafeName: "Clubs"),
    Cafe(imagePath: "assets/images/homeScreen/homeScreen/search/pubs.png", cafeName: "Pubs"),
    Cafe(imagePath: "assets/images/homeScreen/homeScreen/search/pubs.png", cafeName: "Pubs"),
    Cafe(imagePath: "assets/images/homeScreen/homeScreen/search/clubs.png", cafeName: "Clubs"),
  ];

  TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 24 * HR,
              ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr('homeSearch.search', context: context),
                            style: TextStyle(
                              fontSize: 17 * HR,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: "SF Pro",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0 * WR, vertical: 16.0 * HR),
                child: TextField(
                  controller: _searchController,
                  onSubmitted: (value) {
                    // Add the recent search term to the list
                    setState(() {
                      recentSearches.add(value);
                    });
                    // Do something with the search term (e.g., perform search)
                    _handleSearch(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Color(0xFF3C3C434D)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.blue), // Set your desired border color here
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0 * HR,
                      horizontal: 16.0 * WR,
                    ),
                  ),
                ),
              ),
              // Display recent searches
              // Inside the "Recent searches" section
              if (recentSearches.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(left: 16 * WR),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 7 * HR),
                          child: Text(
                            tr('homeSearch.recent_searches', context: context),
                            style: TextStyle(
                              fontSize: 17 * HR,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: "SF Pro",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16 * HR),
                          child: Wrap(
                            spacing: 8.0 * HR,
                            children: recentSearches
                                .map((search) => Column(
                              children: [
                                RecentSearchChip(search: search),
                                Padding(
                                  padding: EdgeInsets.only(right: 16 * HR),
                                  child: Divider(
                                    height: 38.0 * HR,
                                    color: Colors.grey, // Change color as needed
                                  ),
                                ),
                              ],
                            ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(left: 16 * WR, bottom: 20 * HR, top: 24 * HR),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    tr('homeSearch.allCategories', context: context),
                    style: TextStyle(
                      fontSize: 17 * HR,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "SF Pro",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0 * WR, vertical: 8.0 * HR), // Adjust the padding as needed
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    childAspectRatio: 168 / 76,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cafesListd.length,
                  itemBuilder: (context, index) {
                    final cafe = cafesListd[index];
                    return ImageContainer(cafe.imagePath, cafe.cafeName);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16 * WR, bottom: 20 * HR, top: 24 * HR),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    tr('homeSearch.topCategories', context: context),
                    style: TextStyle(
                      fontSize: 17 * HR,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "SF Pro",
                    ),
                  ),
                ),
              ),
              Container(

                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0 * WR, vertical: 8.0 * HR), // Adjust the padding as needed
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: 168 / 76,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cafesListd.length,
                    itemBuilder: (context, index) {
                      final cafe = cafesListd[index];
                      return ImageContainer(cafe.imagePath, cafe.cafeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSearch(String searchTerm) {
    // Implement your search logic here
    print("Performing search for: $searchTerm");
  }
}

class RecentSearchChip extends StatelessWidget {
  final String search;

  RecentSearchChip({required this.search});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38.0 * WR,
          height: 38.0 * HR,
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F7),
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: Icon(
            Icons.history,
            size: 18.0 * HR,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 16.0 * WR),
          child: Text(
            search,
            style: TextStyle(
              fontSize: 15 * HR,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: "SF Pro",
            ),
          ),
        ),
      ],
    );
  }
}





class ImageContainer extends StatelessWidget {
  final String imagePath;
  final String cafename;

  ImageContainer(this.imagePath, this.cafename);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 200 * HR), // Adjust the maxHeight as needed
      margin: EdgeInsets.symmetric(horizontal: 4.0 * WR, vertical: 4.0 * HR),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              imagePath,
              height: 150 * HR,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 150 * HR,
            width: 343 * WR,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(1), Colors.transparent],
              ),
            ),
          ),
          Center(
            child: Positioned(
              top: 8.0 * HR,
              left: 8.0 * WR,
              child: Text(
                cafename,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
