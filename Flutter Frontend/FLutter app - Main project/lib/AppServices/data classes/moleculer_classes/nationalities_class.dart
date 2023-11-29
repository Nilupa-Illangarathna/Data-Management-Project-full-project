import 'dart:convert';

class NationalitiesData {
  List<String> nationalities;

  NationalitiesData({required this.nationalities});

  factory NationalitiesData.fromJson(Map<String, dynamic> json) {
    dynamic nationalitiesJson = json['nationalities'];

    if (nationalitiesJson is String) {
      // Handle 'Nationalities' as a string and convert it to a list
      List<String> nationalitiesList = jsonDecode(nationalitiesJson)
          .map<String>((item) => item.toString())
          .toList();

      return NationalitiesData(nationalities: nationalitiesList);
    } else if (nationalitiesJson is List<dynamic>) {
      // Handle 'Nationalities' as a list of strings
      List<String> nationalitiesList =
      nationalitiesJson.map<String>((item) => item.toString()).toList();

      return NationalitiesData(nationalities: nationalitiesList);
    } else {
      // Handle other cases (empty or unexpected type)
      return NationalitiesData(nationalities: []);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'Nationalities': nationalities,
    };
  }

  void printKeys({bool printKeys = true}) {
    if (printKeys) {
      print('Nationalities Keys:');
      print(' - Nationalities: $nationalities');
    }
  }
}

void main() {
  // Your JSON string
  String jsonString = '''
{
  "nationalities": ["United Kingdom", "France", "Germany"]
}
''';

  // Parse JSON using NationalitiesData.fromJson
  Map<String, dynamic> jsonData = jsonDecode(jsonString);
  NationalitiesData nationalitiesData = NationalitiesData.fromJson(jsonData);

  // Access the parsed data through the nationalitiesData variable
  nationalitiesData.printKeys();
}
