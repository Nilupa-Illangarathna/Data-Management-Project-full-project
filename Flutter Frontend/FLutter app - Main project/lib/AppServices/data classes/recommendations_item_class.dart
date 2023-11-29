import 'dart:math';

import 'package:main_app/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';

import '../../Classes/enams/enum.dart';
import '/API_Classes/global_applications/global_applications.dart';
import '/AppServices/data%20classes/entire_row_class.dart';

//FIXME can remove these
final random = Random();

class Recommendation {
  final EntireRowData entireRow;
  final int rank;
  final double similarityScore;

  Recommendation({
    required this.entireRow,
    required this.rank,
    required this.similarityScore,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      entireRow: EntireRowData.fromJson(json['entire_row']),
      rank: 0,
      similarityScore: 0.0,
    );
  }

  int get sequence => sequence;

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'similarity_score': similarityScore,
      'hotel name': entireRow.hotelNameValues,
      'entire_row': entireRow.toJson(),
    };
  }

  void printAll() {
    if(print_enabled){
      print("Rank: $rank");
      print("Similarity Score: $similarityScore");
      entireRow.printAll();}
  }



  // HotelData generateDummyHotelData(int i) {
  //   return HotelData(
  //     PlaceID: entireRow.sequence, // Random PlaceID for demonstration
  //     LocationType: CustomPlaceType.club, // Set the location type as needed
  //     isFavorite: (entireRow.isFavorite.toLowerCase() == 'true'), // Default value for isFavorite
  //     isRecommended: similarityScore == -1? "false" : similarityScore>0.6? "true" : "false", // Default value for isRecommended
  //     isVisited: (random.nextBool() ? 'true' : 'false'), // Default value for isVisited
  //     imageUrl: getImageUrl(entireRow.placeType), // Dummy image URL
  //     name: entireRow.hotelNameValues, // Dummy hotel name
  //     address: entireRow.hotelAddressValues, // Dummy address
  //     location: "", // Dummy location
  //     rating: entireRow.averageScoreValues.toString(), // Dummy rating
  //     reviews: generateNumberOfReviews(), // Dummy review count
  //     food_grade: entireRow.foodGrade, // Dummy food grade
  //     positiveSummary: "entireRow.cleanedPositiveSummary", // Dummy positive summary
  //     negativeSummmary: "entireRow.cleanedNegativeSummary", // Dummy negative summary
  //
  //
  //     latitude: entireRow.latitude as double,
  //     longitude: entireRow.longitude as double,
  //     negativeSentenceColumnSentiment: entireRow.negativeSentenceColumnSentiment,
  //     positiveReview: "entireRow.positiveReview",
  //     positiveSentenceColumnSentiment: entireRow.positiveSentenceColumnSentiment,
  //     reviewDateValues: "entireRow.reviewDateValues",
  //     reviewerScore: entireRow.reviewerScore,
  //   );
  // }




  CustomPlaceType getLocationType(String locationType){
    CustomPlaceType PlaceType;

    switch (locationType) {
      case 'hotels':
        PlaceType = CustomPlaceType.hotel;
        break;
      case 'Cafes':
        PlaceType = CustomPlaceType.cafe;
        break;
      case 'Restaurants':
        PlaceType = CustomPlaceType.restaurant;
        break;
      case 'Bars':
        PlaceType = CustomPlaceType.bar;
        break;
      case 'Clubs':
        PlaceType = CustomPlaceType.club;
        break;
      default:
        PlaceType = CustomPlaceType.all;
    }
    return PlaceType;
  }






  String getImageUrl(String locationType){

    CustomPlaceType PlaceType;
    int imageNumber = random.nextInt(imageCount) + 1;
    String LocationType ="";


    PlaceType = getLocationType(locationType);


    switch (PlaceType) {
      case CustomPlaceType.hotel:
        LocationType="Hotel";
        break;
      case CustomPlaceType.cafe:
        LocationType="Cafe";
        break;
      case CustomPlaceType.restaurant:
        LocationType="Restaurant";
        break;
      case CustomPlaceType.bar:
        LocationType="Bar";
        break;
      case CustomPlaceType.club:
        LocationType="Club";
        break;
      default:
        LocationType="All";
    }


    String imageUrld = currently_simulating ? 'assets/images/homeScreen/homeScreen/places/${LocationType.toLowerCase()}/${LocationType.toLowerCase()}0${imageNumber.toString()}.png': 'https://picsum.photos/700/700?random=24';
    return imageUrld;
  }


  String generateNumberOfReviews() {
    Random random = Random();
    int numberOfReviews = random.nextInt(99001) + 10; // Generate a random number between 10 and 100000

    if (numberOfReviews < 1000) {
      return numberOfReviews.toString();
    } else {
      int thousands = numberOfReviews ~/ 1000;
      int remainder = numberOfReviews % 1000;
      String result = '$thousands.$remainder k';
      return result;
    }
  }
}
