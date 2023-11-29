class HotelRecommendationFormData {
  static String destination = '';
  static String checkInDate = '';
  static String checkOutDate = '';
  static String budget = '';
  static String amenities = '';

  static String generatePromptString() {
    return '''
    Destination: $destination
    Check-In Date: $checkInDate
    Check-Out Date: $checkOutDate
    Budget: $budget
    Amenities: $amenities
    ''';
  }
}
