class ReviewData {
  Map<String, dynamic> attributeValue;

  ReviewData({required this.attributeValue});

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(attributeValue: json['attribute_value']);
  }
}
