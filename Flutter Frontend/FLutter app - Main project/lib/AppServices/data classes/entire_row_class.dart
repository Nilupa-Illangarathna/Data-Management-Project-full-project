import 'dart:convert';
import 'dart:ffi';

import '/API_Classes/global_applications/global_applications.dart';
import '/AppServices/data%20classes/moleculer_classes/nationalities_class.dart';
import '/AppServices/data%20classes/moleculer_classes/positive_review_dict_list_class.dart';
import '/AppServices/data%20classes/moleculer_classes/positive_review_embedding_list_class.dart';

class EntireRowData {
  // int sequenceNumber;
  int sequence;
  String hotelNameValues;
  String hotelAddressValues;
  // String reviewDateValues;
  double averageScoreValues;
  String reviewerNationalityValues;
  String negativeSentenceColumnSentiment;
  // double negativeSentenceColumnPositivityPercentage;
  // double negativeSentenceColumnNegativityPercentage;
  // String cleanedNegativeSummary; //TODO
  String positiveSentenceColumnSentiment;
  // double positiveSentenceColumnPositivityPercentage;
  // double positiveSentenceColumnNegativityPercentage;
  // String cleanedPositiveSummary;//TODO
  double reviewerScore;
  String latitude;
  String longitude;
  // EmbeddingsList positiveReviewEmbeddings;
  // NationalitiesData nationalitiesData;
  // PositiveReviewList positiveReviewList;
  String placeType;
  String foodGrade;
  String isFavorite;

  EntireRowData({
    // required this.sequenceNumber,
    required this.sequence,
    required this.hotelNameValues,
    required this.hotelAddressValues,
    // required this.reviewDateValues,
    required this.averageScoreValues,
    required this.reviewerNationalityValues,
    required this.negativeSentenceColumnSentiment,
    // required this.negativeSentenceColumnPositivityPercentage,
    // required this.negativeSentenceColumnNegativityPercentage,
    // required this.cleanedNegativeSummary,
    // required this.positiveReview,
    required this.positiveSentenceColumnSentiment,
    // required this.positiveSentenceColumnPositivityPercentage,
    // required this.positiveSentenceColumnNegativityPercentage,
    // required this.cleanedPositiveSummary,
    required this.reviewerScore,
    required this.latitude,
    required this.longitude,
    // required this.positiveReviewEmbeddings,
    // required this.nationalitiesData,
    // required this.positiveReviewList,
    required this.placeType,
    required this.foodGrade,
    required this.isFavorite,
  });

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      "entire_row": {
        "Average_Score_values": averageScoreValues,
        // "Cleaned_Negative_Summmary": cleanedNegativeSummary,
        // "Cleaned_Positive_Summmary": cleanedPositiveSummary,
        "Hotel_Address_values": hotelAddressValues,
        "Hotel_Name_values": hotelNameValues,
        // "Nationalities": nationalitiesData.toJson(),
        // "Negative_sentence_column_Negativity_Percentage":
        // negativeSentenceColumnNegativityPercentage,
        // "Negative_sentence_column_Positivity_Percentage":
        // negativeSentenceColumnPositivityPercentage,
        "Negative_sentence_column_Sentiment": negativeSentenceColumnSentiment,
        // "Positive_Review": positiveReview,
        // "Positive_Review_Dict": positiveReviewList.toJson(),
        // "Positive_Review_Embeddings": positiveReviewEmbeddings.toJson(),
        // "Positive_sentence_column_Negativity_Percentage":
        // positiveSentenceColumnNegativityPercentage,
        // "Positive_sentence_column_Positivity Percentage":
        // positiveSentenceColumnPositivityPercentage,
        "Positive_sentence_column_Sentiment": positiveSentenceColumnSentiment,
        // "Review_Date_values": reviewDateValues,
        "Reviewer_Nationality_values": reviewerNationalityValues,
        "Reviewer_Score": reviewerScore,
        "Sequence": sequence,
        // "Sequence_Number": sequenceNumber,
        "food_grade": foodGrade,
        "isFavorite": isFavorite.toString(),
        "latitude": latitude,
        "longitude": longitude,
        "place_type": placeType,
      }
    };
  }

  // Convert JSON to object
  factory EntireRowData.fromJson(Map<String, dynamic> json) {
    return EntireRowData(
      // sequenceNumber: json["Sequence_Number"] ?? 0,
      sequence: json["Sequence"] as int ?? 0,
      hotelNameValues: json["Hotel_Name_values"] ?? "",
      hotelAddressValues: json["Hotel_Address_values"] ?? "",
      // reviewDateValues: json["Review_Date_values"] ?? "",
      averageScoreValues: json["Average_Score_values"] as double ?? 0.0,
      reviewerNationalityValues: json["Reviewer_Nationality_values"] ?? "",
      negativeSentenceColumnSentiment: json["Negative_sentence_column_Sentiment"] ?? "",
      // negativeSentenceColumnPositivityPercentage: (json["Negative_sentence_column_Positivity_Percentage"] as num?)?.toDouble() ?? 0.0,
      // negativeSentenceColumnNegativityPercentage: (json["Negative_sentence_column_Negativity_Percentage"] as num?)?.toDouble() ?? 0.0,
      // cleanedNegativeSummary: json["Cleaned_Negative_Summmary"] ?? "",
      // positiveReview: json["Positive_Review"] ?? "",
      positiveSentenceColumnSentiment: json["Positive_sentence_column_Sentiment"] ?? "",
      // positiveSentenceColumnPositivityPercentage: (json["Positive_sentence_column_Positivity_Percentage"] as num?)?.toDouble() ?? 0.0,
      // positiveSentenceColumnNegativityPercentage: (json["Positive_sentence_column_Negativity_Percentage"] as num?)?.toDouble() ?? 0.0,
      // cleanedPositiveSummary: json["Cleaned_Positive_Summmary"] ?? "",
      reviewerScore: json["Reviewer_Score"] as double?? 0.0,
      latitude: json["latitude"] ?? "",
      longitude: json["longitude"] ?? "",
      // positiveReviewEmbeddings: EmbeddingsList.fromJson(json["entire_row"]["Positive_Review_Embeddings"] ?? {}),
      // Handle 'Nationalities' as a List<String>
      // nationalitiesData: NationalitiesData.fromJson(
      //   json["entire_row"]["Nationalities"] is String
      //       ? {"nationalities": jsonDecode(json["entire_row"]["Nationalities"])}
      //       : json["entire_row"]["Nationalities"] ?? {},
      // ),
      // Handle 'Positive_Review_Dict' as a String
      // positiveReviewList: PositiveReviewList.fromJson(
      //   json["entire_row"]["Positive_Review_Dict"] is String
      //       ? jsonDecode(json["entire_row"]["Positive_Review_Dict"])
      //       : json["entire_row"]["Positive_Review_Dict"] ?? {},
      // ),
      placeType: json["place_type"] ?? "",
      foodGrade: json["food_grade"] ?? "",
      isFavorite: json["isFavorite"] ?? "",
    );
  }

  // Print all attributes
  void printAll() {
    if(print_enabled){
      // print("Sequence Number: $sequenceNumber");
      print("Sequence: $sequence");
      print("Hotel Name: $hotelNameValues");
      print("Hotel Address: $hotelAddressValues");
      // print("Review Date: $reviewDateValues");
      print("Average Score: $averageScoreValues");
      print("Reviewer Nationality: $reviewerNationalityValues");
      print(
          "Negative Sentence Column Sentiment: $negativeSentenceColumnSentiment");
      // print(
      //     "Negative Sentence Column Positivity Percentage: $negativeSentenceColumnPositivityPercentage");
      // print(
      //     "Negative Sentence Column Negativity Percentage: $negativeSentenceColumnNegativityPercentage");
      // print("Cleaned Negative Summary: $cleanedNegativeSummary");
      // print("Positive Review: $positiveReview");
      print(
          "Positive Sentence Column Sentiment: $positiveSentenceColumnSentiment");
      // print(
      //     "Positive Sentence Column Positivity Percentage: $positiveSentenceColumnPositivityPercentage");
      // print(
      //     "Positive Sentence Column Negativity Percentage: $positiveSentenceColumnNegativityPercentage");
      // print("Cleaned Positive Summary: $cleanedPositiveSummary");
      print("Reviewer Score: $reviewerScore");
      print("Latitude: $latitude");
      print("Longitude: $longitude");
      print("Place Type: $placeType");
      print("Food Grade: $foodGrade");
      print("Is Favorite: $isFavorite");
    }
  }

  // Return the whole object
  EntireRowData getWholeObject() {
    return this;
  }
}