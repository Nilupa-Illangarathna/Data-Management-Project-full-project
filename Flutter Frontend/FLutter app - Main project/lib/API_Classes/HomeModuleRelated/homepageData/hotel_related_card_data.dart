
//class
import 'dart:math';

import '/Classes/enams/enum.dart';
import '/API_Classes/global_applications/global_applications.dart';

class HotelData {
  final int PlaceID;
  late final CustomPlaceType LocationType;
  late bool isFavorite;
  late String isRecommended;
  late String isVisited;
  late String imageUrl;
  late String name;
  late String address;
  late String location;
  late String rating;
  late String reviews;
  late String food_grade;
  late String positiveSummary;
  late String negativeSummmary;

  late double longitude;
  late double latitude;
  late String negativeSentenceColumnSentiment;
  late String positiveReview;
  late String positiveSentenceColumnSentiment;
  late String reviewDateValues;
  late double reviewerScore;

  HotelData({
    required this.PlaceID,
    required this.LocationType,
    required this.isFavorite,
    required this.isRecommended,
    required this.isVisited,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.food_grade,
    required this.positiveSummary,
    required this.negativeSummmary,

    required this.longitude,
    required this.latitude,
    required this.negativeSentenceColumnSentiment,
    required this.positiveReview,
    required this.positiveSentenceColumnSentiment,
    required this.reviewDateValues,
    required this.reviewerScore,
  });


  // Print function to display the hotel data's attributes
  void printHotelDataDetails() {
    print('Place ID: $PlaceID');
    print('Location Type: $LocationType');
    print('Is Favorite: $isFavorite');
    print('Is Recommended: $isRecommended');
    print('Is Visited: $isVisited');
    print('Image URL: $imageUrl');
    print('Name: $name');
    print('Address: $address');
    print('Location: $location');
    print('Rating: $rating');
    print('Reviews: $reviews');
    print('Food Grade: $food_grade');
    print('Negative Summmary: $negativeSummmary');
    print('Positive Summmary: $positiveSummary');
  }
}

String positiveDescription = "Exceptional service, spotless rooms, and a convenient location—this hotel exceeded my expectations. A truly delightful stay!";
String negativeDescription = "Dated rooms, street noise, and indifferent staff. Needs improvements for a more comfortable experience. Won't be returning.";

//FIXME can remove these
final random = Random();
final number_of_available_images=5;


List<HotelData> AllPlacetemp =  [];

// TODO Load all the locations to this array
List<HotelData> AllPlaces =  [
HotelData(PlaceID: 1,  LocationType: CustomPlaceType.cafe,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/cafes/cafe0${random.nextInt(number_of_available_images) + 1}.png'            : 'https://picsum.photos/700/700?random=0' , rating: '4.2', name: 'The Cricket Club Cafe',    address: '34 Queens Rd, Colombo 00300',                                            location: 'Colombo', reviews: '1K+',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 2,  LocationType: CustomPlaceType.cafe,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/cafes/cafe0${random.nextInt(number_of_available_images) + 1}.png'            : 'https://picsum.photos/700/700?random=1' , rating: '4.5', name: 'Café on the 5th',          address: 'No 5, Alfred House Gardens, Colombo 00300',                              location: 'Colombo', reviews: '5K+',   food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 3,  LocationType: CustomPlaceType.cafe,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/cafes/cafe0${random.nextInt(number_of_available_images) + 1}.png'            : 'https://picsum.photos/700/700?random=2' , rating: '4.1', name: 'Bake House',               address: '57 Galle Road, Colombo 00300',                                           location: 'Colombo', reviews: '10K+',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 4,  LocationType: CustomPlaceType.cafe,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/cafes/cafe0${random.nextInt(number_of_available_images) + 1}.png'            : 'https://picsum.photos/700/700?random=3' , rating: '4.0', name: 'Green Cabin',              address: '453 Galle Road, Colombo 00300',                                          location: 'Colombo', reviews: '20K+',  food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 5,  LocationType: CustomPlaceType.cafe,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/cafes/cafe0${random.nextInt(number_of_available_images) + 1}.png'            : 'https://picsum.photos/700/700?random=4' , rating: '4.3', name: 'The t-Lounge by Dilmah',   address: '111 Galle Road, Colombo 00300',                                          location: 'Colombo', reviews: '40K+',  food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 6,  LocationType: CustomPlaceType.cafe,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/cafes/cafe0${random.nextInt(number_of_available_images) + 1}.png'            : 'https://picsum.photos/700/700?random=5' , rating: '4.4', name: 'Whight & Co',              address: '7 Chatham St, Colombo 00300',                                            location: 'Colombo', reviews: '80K+',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 7,  LocationType: CustomPlaceType.cafe,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/cafes/cafe0${random.nextInt(number_of_available_images) + 1}.png'            : 'https://picsum.photos/700/700?random=6' , rating: '4.1', name: 'Barista - Thimbirigasyaya',address: '115 Thimbirigasyaya Road, Colombo 00300',                                location: 'Colombo', reviews: '204',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 8,  LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=7' , rating: '4.2', name: 'The Curry Leaf',           address: '1A, De Fonseka Pl, Colombo 00500',                                       location: 'Colombo', reviews: '5K+',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 9,  LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=8' , rating: '4.5', name: 'Nuga Gama',                address: '77, Galle Rd, Colombo 00300',                                            location: 'Colombo', reviews: '10K+',  food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 10, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=9' , rating: '4.1', name: 'Ministry of Crab',         address: 'Old Dutch Hospital, Colombo 00100',                                      location: 'Colombo', reviews: '1K+',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 11, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=10', rating: '4.0', name: 'The Lagoon',               address: '115, Sir Chittampalam A Gardiner Mawatha, Colombo 00200',                location: 'Colombo', reviews: '80K+',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 12, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=11', rating: '4.3', name: "Upali's by Nawaloka",      address: "65, St Michael's Rd, Colombo 00300",                                     location: 'Colombo', reviews: '20K+',  food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 13, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=12', rating: '4.4', name: 'Shanmugas',                address: '53/3 Ramakrishna Rd, Colombo 00600',                                     location: 'Colombo', reviews: '40K+',  food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 14, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=13', rating: '4.1', name: 'The Tuna & The Crab',      address: 'Dutch Hospital Shopping Precinct, Colombo 00100',                        location: 'Colombo', reviews: '204',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 15, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=14', rating: '4.6', name: 'Café de Flore',            address: '2 Alfred House Rd, Colombo 00300',                                       location: 'Colombo', reviews: '1K+',   food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 16, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=15', rating: '4.2', name: 'The Gallery Café',         address: '2 Alfred House Rd, Colombo 00300',                                       location: 'Colombo', reviews: '5K+',   food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 17, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=16', rating: '4.0', name: 'Black Cat Café',           address: '11 Wijerama Mawatha, Colombo 00700',                                     location: 'Colombo', reviews: '10K+',  food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 18, LocationType: CustomPlaceType.restaurant,isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/restaurant/restaurant0${random.nextInt(number_of_available_images) + 1}.png' : 'https://picsum.photos/700/700?random=17', rating: '4.3', name: 'The Sizzle',               address: '41 Maitland Cres, Colombo 00700',                                        location: 'Colombo', reviews: '20K+',  food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 19, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=18', rating: '4.4', name: 'Colombo Rowing Club',      address: '73/15A, Sir Marcus Fernando Mawatha, Colombo 00700',                     location: 'Colombo', reviews: '1K+',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 20, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=19', rating: '4.0', name: 'Clique',                   address: '23-30 Union Pl, Colombo 00200',                                          location: 'Colombo', reviews: '5K+',   food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 21, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=20', rating: '4.3', name: 'Silk',                     address: '28 Bank Arcade Building, York St, Colombo 00100',                        location: 'Colombo', reviews: '10K+',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 22, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=21', rating: '4.5', name: 'Ceilão The Bar',           address: 'No. 130, Horton Pl, Colombo 00700',                                      location: 'Colombo', reviews: '20K+',  food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 23, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=22', rating: '4.1', name: '7Degrees North',           address: 'Galle Face Hotel, 2 Galle Road, Colombo 00300',                          location: 'Colombo', reviews: '40K+',  food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 24, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=23', rating: '4.2', name: 'ON14 Rooftop Lounge & Bar',address: '14 Sir Baron Jayatilake Mawatha, Colombo 00100',                         location: 'Colombo', reviews: '80K+',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 25, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=24', rating: '4.4', name: 'ZAZA Bar',                 address: '41, Maitland Crescent, Colombo 00700',                                   location: 'Colombo', reviews: '204',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 26, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=25', rating: '4.3', name: 'Park Street Trattoria',    address: 'Park St, Colombo 00200',                                                 location: 'Colombo', reviews: '516',   food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 27, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=26', rating: '4.1', name: 'Sky Lounge',               address: '42 Sir M V Musuem Building, Ananda Coomaraswamy Mawatha, Colombo 00700', location: 'Colombo', reviews: '1000',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 28, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=27', rating: '4.5', name: 'Rhythm & Blues',           address: '32 Park St, Colombo 00200',                                              location: 'Colombo', reviews: '2050',  food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 29, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=28', rating: '4.2', name: 'Sky Lounge',               address: '42 Sir M V Musuem Building, Ananda Coomaraswamy Mawatha, Colombo 00700', location: 'Colombo', reviews: '4300',  food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 30, LocationType: CustomPlaceType.club,      isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/club/club0${random.nextInt(number_of_available_images) + 1}.png'             : 'https://picsum.photos/700/700?random=29', rating: '4.3', name: 'Sopranos',                 address: '09 Old Dutch Hospital Shopping Precinct, Colombo 00100',                 location: 'Colombo', reviews: '8100',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 31, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=30', rating: '4.2', name: 'Bally’s Casino',           address: '34, D. R. Wijewardena Mawatha, Colombo 00100',                           location: 'Colombo', reviews: '240',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 32, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=31', rating: '4.5', name: 'The Kingsbury Sky Lounge', address: '48, Janadhipathi Mawatha, Colombo 00100',                                location: 'Colombo', reviews: '510',   food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 33, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=32', rating: '4.1', name: 'Cheers Pub',               address: '31, Horton Place, Colombo 00700',                                        location: 'Colombo', reviews: '1K+',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 34, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=33', rating: '4.0', name: 'Amuseum',                  address: '106, 7th Regimental Rd, Colombo 00900',                                  location: 'Colombo', reviews: '5K+',   food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 35, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=34', rating: '4.3', name: 'Vista Bar at The Hilton',  address: '2 Sir Chittampalam A Gardiner Mawatha, Colombo 00200',                   location: 'Colombo', reviews: '10K+',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 36, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=35', rating: '4.4', name: 'Loft Lounge Bar',          address: '48 Park St, Colombo 00200',                                              location: 'Colombo', reviews: '20K+',  food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 37, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=36', rating: '4.1', name: 'Sugar Bistro & Wine Bar',  address: '29, Maitland Cres, Colombo 00700',                                       location: 'Colombo', reviews: '40K+',  food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 38, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=37', rating: '4.6', name: 'Onyx Lounge',              address: '381, Galle Rd, Colombo 00300',                                           location: 'Colombo', reviews: '80K+',  food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 39, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=38', rating: '4.2', name: 'Honey Beach Club',         address: '223 Galle Rd, Colombo 00400',                                            location: 'Colombo', reviews: '204',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 40, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=39', rating: '4.0', name: 'Cheers Pub',               address: '31, Horton Place, Colombo 00700',                                        location: 'Colombo', reviews: '516',   food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 41, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=40', rating: '4.3', name: 'Sugar Bistro & Wine Bar',  address: '29, Maitland Cres, Colombo 00700',                                       location: 'Colombo', reviews: '4K+',   food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 42, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=41', rating: '4.2', name: 'Loft Lounge Bar',          address: '48 Park St, Colombo 00200',                                              location: 'Colombo', reviews: '6K+',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 43, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=42', rating: '4.4', name: 'Onyx Lounge',              address: '381, Galle Rd, Colombo 00300',                                           location: 'Colombo', reviews: '3K+',   food_grade: 'AA' ,  positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 44, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=43', rating: '4.1', name: 'Honey Beach Club',         address: '223 Galle Rd, Colombo 00400',                                            location: 'Colombo', reviews: '2K+',   food_grade: 'AAA' , positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
HotelData(PlaceID: 45, LocationType: CustomPlaceType.bar,       isFavorite:false, isRecommended: (random.nextBool() ? 'true' : 'false'), isVisited: (random.nextBool() ? 'true' : 'false'), imageUrl: currently_simulating ? 'assets/images/homeScreen/homeScreen/places/bar/bar0${random.nextInt(number_of_available_images) + 1}.png'               : 'https://picsum.photos/700/700?random=44', rating: '4.6', name: 'Sky Lounge',               address: '42 Sir M V Musuem Building, Ananda Coomaraswamy Mawatha, Colombo 00700', location: 'Colombo', reviews: '8K+',   food_grade: 'A' ,   positiveSummary: positiveDescription, negativeSummmary: negativeDescription, longitude : 0.0, latitude : 0.0, positiveSentenceColumnSentiment: "", negativeSentenceColumnSentiment: "", positiveReview: "", reviewDateValues: "", reviewerScore: 0.0),
];




//TODO these can beused as the arrays
List<HotelData> recommendedPlacesList = [];
List<HotelData> visitedPlacesList = [];