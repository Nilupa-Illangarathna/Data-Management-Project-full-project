import 'dart:convert';
import 'dart:math';

import 'package:main_app/API_Classes/HomeModuleRelated/placeData/place_data.dart';
import 'package:main_app/API_Classes/data.dart';
import 'package:main_app/API_Classes/global_applications/global_applications.dart';
import 'package:main_app/AppServices/data%20classes/recommendations_item_class.dart';
import 'package:main_app/Pages/LoadingScreen/loading_screen.dart';

import '../../API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import '../../API_Classes/Positive_Negative_Corausal/customizer_data_instance.dart';
import '/DartFilesForPages/App Drawer/MainMenuRelated(Drawer and other screens)/app_theme.dart';
import '/DartFilesForPages/App Drawer/custom_drawer_for_main_Menu/drawer_user_controller.dart';
import '/DartFilesForPages/App Drawer/custom_drawer_for_main_Menu/home_drawer.dart';
import '/DartFilesForPages/App Drawer/MainMenuRelated(Drawer and other screens)/feedback_screen.dart';
import '/DartFilesForPages/App Drawer/MainMenuRelated(Drawer and other screens)/help_screen.dart';
import '/DartFilesForPages/App Drawer/MainMenuRelated(Drawer and other screens)/invite_friend_screen.dart';
import 'package:flutter/material.dart';
import '../Helper Screen/helper_screen.dart';
import '../Homepage Screen/HomePage.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';


class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;
  late bool isLoaded;

  @override
  void initState() {
    isLoaded = false;
    print(isLoaded);
    !isSimmulated? getInitialRecommendations() : (){};
    drawerIndex = DrawerIndex.HOME;
    screenView = HomePage();
    // setState(() {
    //   isLoaded = true;
    // });
    print(isLoaded);
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoaded = true;
        // Use 'allPlacesTemp' to update your UI or state
        print(isLoaded);
      });
    });
  }


// Replace this URL with your actual API endpoint
  final String apiUrl = baseUrlRoute + '/initial_recommendations?';

  Future<void> getInitialRecommendations() async {
    try {
      // Check if the device is connected to the internet
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection');
        return;
      }

      // Define the request body
      final requestBody = {
        "num_recommendations": 100,
        "onWhich":"Mobile"
      }; // Adjust the value as needed

      // Make the API call using POST with headers and request body
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Connection': 'keep-alive',
          'Keep-Alive': 'timeout=5, max=1000',
        },
       body: json.encode(requestBody),
      ).timeout(Duration(seconds: 60));


      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse and print the response
        final data = json.decode(response.body);
        print('Initial Recommendations: $data');

        // Convert the JSON string to a list of maps
        List<Map<String, dynamic>> jsonList =
        List<Map<String, dynamic>>.from(json.decode(response.body));

        // Create a list of Recommendation objects
        List<Recommendation> recommendations =
        jsonList.map((jsonMap) => Recommendation.fromJson(jsonMap)).toList();

        try {
          AllPlaces = await updateHotelDataWithRecommendation(AllPlaces, recommendations); //TODO this calls the mapping
          print('Update successful');
        } catch (e) {
          print('Error: $e');
        }

        // // FIXME remove below
        // // Print the list of Recommendation objects
        // recommendations.forEach((recommendation) {
        //   print(recommendation.toJson());
        // });
        //
        // List<HotelData> allPlacesTemp = recommendations
        //     .map((recommendation) => recommendation.generateDummyHotelData(5))
        //     .toList();
        //
        // print(allPlacesTemp.length);
        // // FIXME remove above


        // Set the state with the loaded data
        setState(() {
          isLoaded = true;
          // Use 'allPlacesTemp' to update your UI or state
        });
      } else {
        // Handle the error if the request was not successful
        print('Failed to get initial recommendations. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle any other errors that may occur
      print('Errorddds: $error');
    }
  }


  // Function to update HotelData array with Recommendation values
  Future<List<HotelData>> updateHotelDataWithRecommendation(List<HotelData> hotelDataArray, List<Recommendation> recommendationArray) async {
    if (hotelDataArray.length > recommendationArray.length) {
      throw ArgumentError('Arrays must have the same length');
    }


    final random = Random();
    for (int i = 0; i < hotelDataArray.length; i++) {
      // Assuming you have a field in HotelData class to store the Recommendation value
      // hotelDataArray[i].PlaceID = recommendationArray[i].entireRow.sequence;
      hotelDataArray[i].isRecommended = recommendationArray[i].similarityScore == -1? "false" : recommendationArray[i].similarityScore>0.6? "true" : "false"; // Default value for isRecommended
      hotelDataArray[i].isVisited = (random.nextBool() ? 'true' : 'false'); // Default value for isVisited
      hotelDataArray[i].name = recommendationArray[i].entireRow.hotelNameValues; // Dummy hotel name
      hotelDataArray[i].address = recommendationArray[i].entireRow.hotelAddressValues;// Dummy address
      hotelDataArray[i].location = ""; // Dummy location
      hotelDataArray[i].food_grade = recommendationArray[i].entireRow.foodGrade; // Dummy food grade
      hotelDataArray[i].positiveSummary = getRandomNegativeSummary(positiveSummariesList); // Dummy positive summary
      hotelDataArray[i].negativeSummmary = getRandomNegativeSummary(negativeSummariesList); // Dummy negative summary


      hotelDataArray[i].latitude = double.parse(recommendationArray[i].entireRow.latitude);
      hotelDataArray[i].longitude = double.parse(recommendationArray[i].entireRow.longitude);
      hotelDataArray[i].negativeSentenceColumnSentiment = recommendationArray[i].entireRow.negativeSentenceColumnSentiment;
      hotelDataArray[i].positiveSentenceColumnSentiment = recommendationArray[i].entireRow.positiveSentenceColumnSentiment;
      hotelDataArray[i].reviewDateValues = "";
      hotelDataArray[i].reviewerScore = recommendationArray[i].entireRow.reviewerScore;

      // You can update other fields in a similar way based on your mapping
    }


    return hotelDataArray;
  }

  String getRandomNegativeSummary(List <String> SummariesList) {
    Random random = Random();
    int randomIndex = random.nextInt(SummariesList.length);
    return SummariesList[randomIndex];
  }



  // HotelData generateDummyHotelData(int i) {
  //   return HotelData(
  //     PlaceID: entireRow.sequence, // Random PlaceID for demonstration
  //     LocationType: CustomPlaceType.club, // Set the location type as needed
  //     isFavorite: entireRow.isFavorite, // Default value for isFavorite
  //     isRecommended: similarityScore == -1? "false" : similarityScore>0.6? "true" : "false", // Default value for isRecommended
  //     isVisited: (random.nextBool() ? 'true' : 'false'), // Default value for isVisited
  //     imageUrl: getImageUrl(entireRow.placeType), // Dummy image URL
  //     name: entireRow.hotelNameValues, // Dummy hotel name
  //     address: entireRow.hotelAddressValues, // Dummy address
  //     location: "", // Dummy location
  //     rating: entireRow.averageScoreValues.toString(), // Dummy rating
  //     reviews: generateNumberOfReviews(), // Dummy review count
  //     food_grade: entireRow.foodGrade, // Dummy food grade
  //     positiveSummary: entireRow.cleanedPositiveSummary, // Dummy positive summary
  //     negativeSummmary: entireRow.cleanedNegativeSummary, // Dummy negative summary
  //
  //
  //     latitude: entireRow.latitude as double,
  //     longitude: entireRow.longitude as double,
  //     placeType: entireRow.placeType,
  //     negativeSentenceColumnSentiment: entireRow.negativeSentenceColumnSentiment,
  //     positiveReview: entireRow.positiveReview,
  //     positiveSentenceColumnSentiment: entireRow.positiveSentenceColumnSentiment,
  //     reviewDateValues: entireRow.reviewDateValues,
  //     reviewerScore: entireRow.reviewerScore,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: !isLoaded? LoadingScreen() : SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
           ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = HomePage();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;
        case DrawerIndex.HelperScreen:
          setState(() {
            screenView = HelperScreen();
          });
          break;
        default:
          break;
      }
    }
  }
}
