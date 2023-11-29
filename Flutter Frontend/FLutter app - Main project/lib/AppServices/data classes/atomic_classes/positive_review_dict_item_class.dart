import 'dart:convert';

class PositiveReviewItem {
  int sequence;
  String positiveReview;
  String sentiment;
  double positivityPercentage;
  double negativityPercentage;

  PositiveReviewItem({
    required this.sequence,
    required this.positiveReview,
    required this.sentiment,
    required this.positivityPercentage,
    required this.negativityPercentage,
  });

  factory PositiveReviewItem.fromJson(Map<String, dynamic> json) {
    return PositiveReviewItem(
      sequence: json['Sequence'] ?? 0,
      positiveReview: json['Positive_Review'] ?? '',
      sentiment: json['Positive_sentence_column_Sentiment'] ?? '',
      positivityPercentage: json['Positive_sentence_column_Positivity_Percentage'] ?? 0.0,
      negativityPercentage: json['Positive_sentence_column_Negativity_Percentage'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Sequence': sequence,
      'Positive_Review': positiveReview,
      'Positive_sentence_column_Sentiment': sentiment,
      'Positive_sentence_column_Positivity_Percentage': positivityPercentage,
      'Positive_sentence_column_Negativity_Percentage': negativityPercentage,
    };
  }

  void printData({bool printData = true}) {
    if (printData) {
      print('Positive Review Item Data:');
      print(' - Sequence: $sequence');
      print(' - Positive Review: $positiveReview');
      print(' - Sentiment: $sentiment');
      print(' - Positivity Percentage: $positivityPercentage');
      print(' - Negativity Percentage: $negativityPercentage');
    }
  }
}