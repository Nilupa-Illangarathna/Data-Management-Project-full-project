import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '/Classes/enams/enum.dart';
import '/API_Classes/global_applications/global_applications.dart';
import '/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';

class HotelDataProvider extends ChangeNotifier {
  List<HotelData> _recommendedPlaces = [];
  List<HotelData> _visitedPlaces = [];
  bool _isInitialized = false;
  Timer? _timer; //FIXME
  CustomPlaceType PlaceType = CustomPlaceType.cafe;

  HotelDataProvider() {
    // Initialize data here, or you can load data from API in the constructor.
    _recommendedPlaces = []; // Replace with your data-loading logic
    _isInitialized = true; // Set isInitialized to true once data is loaded.
    _setupTimer(); //FIXME
  }

  List<HotelData> get recommendedPlaces => _recommendedPlaces;
  List<HotelData> get visitedPlaces => _visitedPlaces;
  bool get isInitialized => _isInitialized;

  // TODO below two can be used to cnage anything using placeID at anyplace of the code
  // Function to get a single place by PlaceID
  HotelData getPlaceByID(int placeID) {
    final place = AllPlaces.firstWhere(
          (item) => item.PlaceID == placeID,
      orElse: () => HotelData(
        PlaceID: placeID,
        LocationType: CustomPlaceType.cafe, // Replace with default values for other properties
        isFavorite: false,
        isRecommended: '',
        isVisited: '',
        imageUrl: '',
        name: '',
        address: '',
        location: '',
        rating: '',
        reviews: '',
        food_grade: '',
        positiveSummary: '',
        negativeSummmary: '',
        longitude : 0.0, latitude : 0.0,
        positiveSentenceColumnSentiment: "",
        negativeSentenceColumnSentiment: "",
        positiveReview: "",
        reviewDateValues: "",
        reviewerScore: 0.0
      ),
    );
    return place;
  }

  // Function to set a single place by PlaceID
  void setPlaceByID(int placeID, HotelData newPlace) {
    final index = AllPlaces.indexWhere((item) => item.PlaceID == placeID);
    if (index != -1) {
      AllPlaces[index] = newPlace;
      notifyListeners();
    }
  }
  // TODO above two can be used to chage anything using placeID at anyplace of the code

  void notifyListenersUpdated() {
    notifyListeners();
  }


  // //FIXME use the following way  to access them properly
  // // Example of getting a single place by PlaceID
  // final placeID = "placeID123456789"; // Replace with the actual PlaceID
  //
  // final place = <NotifirerName>.getPlaceByID(placeID);
  // if (place != null) {
  // // Make necessary changes to the place
  // place.name = 'New Name';
  // place.address = 'New Address';
  //
  // // Set the updated place
  // <NotifirerName>.setPlaceByID(placeID, place);
  // }

  //////////////////////////////////////////////////////


  // Asynchronous setter for RecommendedPlacesDataList
  Future<void> setRecommendedPlaces(List<HotelData> newPlaces) async {
    // TODO API call to get all the data prior to get into the frontend.
    await Future.delayed(Duration(seconds: 1)); // This delay represents the time taken to do the api call
    // TODO API call to get all the data prior to get into the frontend.
    _recommendedPlaces = newPlaces;
    notifyListeners();
  }

  Future<void> setPlaceType(List<HotelData> newPlaces) async {
    // TODO API call to get all the data prior to get into the frontend.
    await Future.delayed(Duration(seconds: 1)); // This delay represents the time taken to do the api call
    // TODO API call to get all the data prior to get into the frontend.
    _recommendedPlaces = newPlaces;
    notifyListeners();
  }


  Future<void> initDataByType(CustomPlaceType placeType) async {

    PlaceType=placeType;

    //FIltering based on the type and  get all the correct type stores
    _recommendedPlaces = [];
    List<HotelData> dashboardRecomenndationsList= placeType ==CustomPlaceType.all? await all_places_returner(AllPlaces,placeType) : await filtered_places_returner(AllPlaces,placeType);
//To show on dashboard level
    final random = Random();
    int numItemsToPickRecomenndations = random.nextInt(3) + 5; // Pick 2 to 5 items for recommendations

    while (_recommendedPlaces.length < numItemsToPickRecomenndations) {
      int randomIndex = random.nextInt(dashboardRecomenndationsList.length);
      HotelData selectedItem = dashboardRecomenndationsList[randomIndex];

      if (!_recommendedPlaces.contains(selectedItem)) {
        _recommendedPlaces.add(selectedItem);
      }
    }
    notifyListeners();
  }


  // Initislizing the dashboard
  Future<void> initData(CustomPlaceType placeType) async {

    PlaceType=placeType;

    //FIltering based on the type and  get all the correct type stores
    _recommendedPlaces = [];
    _visitedPlaces = [];
    List<HotelData> dashboardRecomenndationsList= await filtered_places_returner(AllPlaces,placeType);
    List<HotelData> dashboardVisitedList= await filtered_places_returner(AllPlaces,placeType);
    //To show on dashboard level
    final random = Random();
    int numItemsToPickRecomenndations = random.nextInt(3) + 5; // Pick 2 to 5 items for recommendations
    int numItemsToPickVisited = random.nextInt(3) + 5; // Pick 2 to 5 items for recommendations

    while (_recommendedPlaces.length < numItemsToPickRecomenndations) {
      int randomIndex = random.nextInt(dashboardRecomenndationsList.length);
      HotelData selectedItem = dashboardRecomenndationsList[randomIndex];

      if (!_recommendedPlaces.contains(selectedItem)) {
        _recommendedPlaces.add(selectedItem);
      }
    }
    while (_visitedPlaces.length < numItemsToPickVisited) {
      int randomIndex = random.nextInt(dashboardVisitedList.length);
      HotelData selectedItem = dashboardVisitedList[randomIndex];

      if (!_visitedPlaces.contains(selectedItem)) {
        _visitedPlaces.add(selectedItem);
      }
    }
    notifyListeners();
  }

  // thi can be used to set the filters to products
  void seeMoreRecommendations(bool isRecommendations) async {
    isRecommendations? _recommendedPlaces.shuffle(): _visitedPlaces.shuffle();
    notifyListeners();
  }

  //Filter and get data
  List<HotelData> all_places_returner(List<HotelData> actualLookingData, CustomPlaceType placeType) {
    // actualLookingData.shuffle();
    return actualLookingData.toList();
  }

  List<HotelData> filtered_places_returner(List<HotelData> actualLookingData, CustomPlaceType placeType) {
    return actualLookingData.where((place) => place.LocationType == placeType).toList();
  }

  //FIXME you can remove this at any time, until the defvelopment is over you can keep this.
  void _setupTimer() {
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      //FIXME Filtering data by place type
      final allPlacesFiltered = all_places_returner(AllPlaces,PlaceType);

      Random random = Random();
      int numberOfItemsToPick = random.nextInt(7) + 3; // Generates a random integer.//TODO this should be the api call to initialize
      _recommendedPlaces = [];
      for (int i = 0; i < numberOfItemsToPick; i++) {
        int randomNumber = random.nextInt(allPlacesFiltered.length);
        _recommendedPlaces.add(allPlacesFiltered[randomNumber]);
      }//TODO till this

      numberOfItemsToPick = random.nextInt(9) + 4; // Generates a random integer//TODO this should be the api call to initialize
      _visitedPlaces = [];
      for (int i = 0; i < numberOfItemsToPick; i++) {
        int randomNumber = random.nextInt(allPlacesFiltered.length);
        _visitedPlaces.add(allPlacesFiltered[randomNumber]);
      }//TODO till this

      notifyListeners();
    }
    );
  }

// Dispose the timer when the provider is no longer needed (e.g., when the app is stopped).
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}




