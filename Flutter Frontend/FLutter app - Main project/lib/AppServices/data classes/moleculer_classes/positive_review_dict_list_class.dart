
import 'package:main_app/AppServices/data%20classes/atomic_classes/positive_review_dict_item_class.dart';

class PositiveReviewList {
  List<PositiveReviewItem> positiveReviewList;

  PositiveReviewList({required this.positiveReviewList});

  // Convert object to JSON
  List<Map<String, dynamic>> toJson() {
    return positiveReviewList.map((item) => item.toJson()).toList();
  }

  // Convert JSON to object
  factory PositiveReviewList.fromJson(dynamic json) {
    if (json is List) {
      // Handle the case where the input is a list
      return PositiveReviewList(
        positiveReviewList: json.map((item) => PositiveReviewItem.fromJson(item)).toList(),
      );
    } else {
      // Handle the case where the input is not a list
      return PositiveReviewList(
        positiveReviewList: [],
      );
    }
  }
}
