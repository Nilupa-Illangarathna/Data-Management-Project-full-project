import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_app/API_Classes/global_applications/global_applications.dart';
import 'package:main_app/AppServices/API_service.dart';
import 'package:main_app/AppServices/data%20classes/entire_row_class.dart';
import 'package:main_app/AppServices/data%20classes/moleculer_classes/positive_review_dict_list_class.dart';
import 'package:main_app/AppServices/data%20classes/moleculer_classes/positive_review_embedding_list_class.dart';
import 'package:main_app/AppServices/data%20classes/recommendations_item_class.dart';
import 'package:main_app/AppServices/data%20classes/review_entire_row.dart';
import 'package:main_app/Pages/HomePageModule/homePageScreen/home_screen.dart';
import 'package:main_app/Pages/HomePageModule/home_controller.dart';
import 'package:provider/provider.dart';
import 'AppServices/API_helper.dart';
import 'Pages/Splash Screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/App Drawer/app_drawer.dart';
import 'classes/theme/theme.dart';
import 'package:flutter/material.dart';

import '/DartFilesForPages/Forms/page01_user_input_form.dart';
import '/stateManagement/changeNotifiers/homePageModule/cart_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/homepage_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/hotel_related_card_data_notifier.dart';
import '/stateManagement/changeNotifiers/homePageModule/shop_items_data_notifier.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';





import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:main_app/AppServices/API_service.dart';
// import 'package:main_app/AppServices/data%20classes/recommendations_irem_class.dart';







class HelperManager {
  static final HelperManager _instance = HelperManager._internal();
  late SharedPreferences _prefs;

  factory HelperManager() {
    return _instance;
  }

  HelperManager._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> isHelperScreenCompleted() async {
    return _prefs.getBool('helperScreenCompleted') ?? false;
  }

  Future<void> setHelperScreenCompleted(bool value) async {
    await _prefs.setBool('helperScreenCompleted', value);
  }
}



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize HelperManager
  await HelperManager().initialize();

  // Get helper screen completion status
  bool isHelperScreenCompleted = await HelperManager().isHelperScreenCompleted();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky
  );

  runApp(
    MultiProvider(
      providers: [
        // Add other providers as needed
        ChangeNotifierProvider(create: (context) => CategoryDataProvider()),
        ChangeNotifierProvider(create: (context) => HotelDataProvider()),
        ChangeNotifierProvider(create: (context) => InsideShopDataNotifier()),
        ChangeNotifierProvider(create: (context) => CartDataProvider()),
      ],
      child: MyApp(isHelperScreenCompleted: isHelperScreenCompleted)
    ),
  );

  // runApp(MyApp(isHelperScreenCompleted: isHelperScreenCompleted));
}







class MyApp extends StatelessWidget {

  final bool isHelperScreenCompleted;

  const MyApp({Key? key, required this.isHelperScreenCompleted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemePatrol(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        colorScheme: ColorScheme.light(secondary: Colors.red),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        colorScheme: ColorScheme.dark(secondary: Colors.red),
        toggleableActiveColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      mode: ThemeMode.system,
      builder: (context, theme) {
        return MaterialApp(
          title: 'Smart Select',
          debugShowCheckedModeBanner: false,
          theme: theme?.light,
          darkTheme: theme?.dark,
          themeMode: theme?.mode,
          // home: HomeScreen(),
          home: SplashScreen(delayDuration: Duration(seconds: 9), isHelperScreenCompleted: isHelperScreenCompleted),
        );
      },
    );


      MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true, // enable Material 3
        primarySwatch: Colors.blue,
      ),

      home: SplashScreen(delayDuration: Duration(seconds: 9), isHelperScreenCompleted: isHelperScreenCompleted),
    );
  }
}














//
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('API Integration Example'),
//         ),
//         body: Center(
//           child: HomePage(),
//         ),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // Replace this URL with your actual API endpoint
//   final String apiUrl = baseUrlRoute + '/get_recommendations?';
//
//   Future<void> getInitialRecommendations() async {
//     try {
//       // Check if the device is connected to the internet
//       var connectivityResult = await Connectivity().checkConnectivity();
//       if (connectivityResult == ConnectivityResult.none) {
//         print('No internet connection');
//         return;
//       }
//
//       // Define the request body
//       final requestBody = {"query_sentence": "Seeking a business-friendly hotel...","num_recommendations": 5}; // Adjust the value as needed
//
//       // Make the API call using POST with headers and request body
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode(requestBody),
//       );
//
//       // Check if the request was successful (status code 200)
//       if (response.statusCode == 200) {
//         // Parse and print the response
//         final data = json.decode(response.body);
//         print('Initial Recommendations: $data');
//
//
//         String jsonString = response.body;
//
//         // Convert the JSON string to a list of maps
//         List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(json.decode(jsonString));
//
//         // Create a list of Recommendation objects
//         List<Recommendation> recommendations = jsonList.map((jsonMap) => Recommendation.fromJson(jsonMap)).toList();
//
//         // print(recommendations.length);
//         //
//         // // Print the list of Recommendation objects
//         // recommendations.forEach((recommendation) {
//         //   print(recommendation.toJson());
//         // });
//
//         recommendations[0].generateDummyHotelData().printHotelDataDetails();
//
//
//       } else {
//         // Handle the error if the request was not successful
//         print('Failed to get initial recommendations. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (error) {
//       // Handle any other errors that may occur
//       print('Error: $error');
//     }
//
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             // Trigger the API call when the button is pressed
//             getInitialRecommendations();
//           },
//           child: Text('Get Initial Recommendations'),
//         ),
//       ],
//     );
//   }
// }
//
//
//









































// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('API Integration Example'),
//         ),
//         body: Center(
//           child: HomePage(),
//         ),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // Replace this URL with your actual API endpoint
//   final String apiUrl = 'http://10.0.2.2:3500/get_recommendations?';
//
//   // Create an instance of ApiService using the helper class
//   final ApiHelper apiHelper = ApiHelper(ApiService());
//
//   Future<void> getInitialRecommendations() async {
//     try {
//       // Check if the device is connected to the internet
//       var connectivityResult = await Connectivity().checkConnectivity();
//       print('one');
//       if (connectivityResult == ConnectivityResult.none) {
//         print('No internet connection');
//         return;
//       }
//       print('one');
//       // Use the helper function to get recommendations
//       final recommendations = await apiHelper.getRecommendations(
//         querySentence: "Seeking a business-friendly hotel...",
//         numRecommendations: 5,
//       );
//       print('one');
//       // Print the structured recommendations
//       for (var recommendation in recommendations) {
//         print('Recommendation Item: $recommendation');
//       }
//     } catch (error) {
//       // Handle any other errors that may occur
//       print('Error: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             // Trigger the API call when the button is pressed
//             getInitialRecommendations();
//           },
//           child: Text('Get Initial Recommendations'),
//         ),
//       ],
//     );
//   }
// }







// main.dart
//
// void handlePositiveReviewEmbedding(String jsonString) {
//   try {
//     // Decode JSON string to map
//     Map<String, dynamic> jsonMap = jsonDecode(jsonString);
//
//     // Create PositiveReviewEmbedding object from JSON map
//     PositiveReviewEmbedding positiveReview = PositiveReviewEmbedding.fromJson(jsonMap);
//
//     // Print to CLI
//     positiveReview.printToCLI();
//   } catch (e) {
//     print('Error decoding JSON: $e');
//   }
// }











//
//
// void main() {
//   // Example input string for Positive_Review_Dict list
//   String jsonString = '''
// [{'Sequence': 497231, 'Positive_Review': \"' Good business hotel'\", 'Positive_sentence_column_Sentiment': 'positive', 'Positive_sentence_column_Positivity_Percentage': 59.2, 'Positive_sentence_column_Negativity_Percentage': 0.0}, {'Sequence': 497230, 'Positive_Review': \"' Great staff and facilities'\", 'Positive_sentence_column_Sentiment': 'positive', 'Positive_sentence_column_Positivity_Percentage': 67.2, 'Positive_sentence_column_Negativity_Percentage': 0.0}]
// ''';
//
//   // Replace single quotes with double quotes
//   jsonString = jsonString.replaceAll("'", '"');
//   jsonString = jsonString.replaceAll("\"", '"');
//
//   // Convert the modified JSON string to a List<Map<String, dynamic>> using jsonDecode
//   List<Map<String, dynamic>> jsonData = List<Map<String, dynamic>>.from(jsonDecode(jsonString));
//
//   // Call the function to handle PositiveReviewDictListClass
//   PositiveReviewDictListClass result = PositiveReviewDictListClass.handlePositiveReviewDictList(jsonData);
//
//   // Access the parsed data through the result variable
//   result.printToCLI();
// }
//


//
// void main() {
//   // Your JSON string
//   String jsonString = '''
// {
//   "attribute_value": {
//     "entire_row": {
//         "Average_Score_values": 8.3,
//         "Cleaned_Negative_Summmary": "My husband had to travel back to bedford after finishing a 12 hour night shift who just wanted a couple of hours sleep this cost my husband a lot of money to travel back to our home and i was very angry to know that he hadn t been let in i will not be staying here again.",
//         "Cleaned_Positive_Summmary": "The staff were quite friendly and helping. The location is very convenient to where i needed to be. Friendly staff the room was what was described. The room was what was described. The room is small a little humid but clean.",
//         "Hotel_Address_values": "43 Worple Road Wimbledon London SW19 4JZ United Kingdom",
//         "Hotel_Name_values": "The Justin James Hotel",
//         "Nationalities": "[United Kingdom]",
//         "Negative_sentence_column_Negativity_Percentage": 0.0,
//         "Negative_sentence_column_Positivity_Percentage": 0.0,
//         "Negative_sentence_column_Sentiment": "positive",
//         "Positive_Review": " Small friendly hotel  Great hotel and clean   Everything was excellent  The room was clean comfortable and reasonable value for money The staff very helpful friendly ",
//         "Positive_Review_Dict": "[{Sequence: 190309, Positive_Review:  Small friendly hotel, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 61.5, Positive_sentence_column_Negativity_Percentage: 0.0}, {Sequence: 190308, Positive_Review:  Great hotel and clean , Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 87.2, Positive_sentence_column_Negativity_Percentage: 0.0}, {Sequence: 190307, Positive_Review:  Everything was excellent, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 78.7, Positive_sentence_column_Negativity_Percentage: 0.0}, {Sequence: 190306, Positive_Review:  The room was clean comfortable and reasonable value for money The staff very helpful friendly , Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 78.3, Positive_sentence_column_Negativity_Percentage: 0.0}]",
//         "Positive_sentence_column_Negativity Percentage": 0.0,
//         "Positive_sentence_column_Positivity Percentage": 61.5,
//         "Positive_sentence_column_Sentiment": "positive",
//         "Review_Date_values": "2016-04-12",
//         "Reviewer_Nationality_values": " United Kingdom ",
//         "Reviewer_Score": 7.9,
//         "Sequence": 190309,
//         "Sequence_Number": 29930,
//         "food_grade": "AAA",
//         "isFavorite": "false",
//         "latitude": "51.4202661",
//         "longitude": "-0.21126799999999998",
//         "place_type": "Cafes"
//     },
//     "rank": 1,
//     "similarity_score": 0.8220723867416382
// }
// }
//   ''';
//
//   // Parse JSON using ReviewData.fromJson
//   Map<String, dynamic> jsonData = jsonDecode(jsonString);
//   ReviewData reviewData = ReviewData.fromJson(jsonData);
//
//   // Access the parsed data through the reviewData variable
//   print(reviewData.attributeValue['rank']);
//   print(reviewData.attributeValue['similarity_score']);
// }



















// void main() {
//   // Your JSON string
//   String jsonString = '''
// {
//   "attribute_value": {
//     "entire_row": {
//         "Positive_Review_Dict": [
//             {"Sequence": 190309, "Positive_Review": "Small friendly hotel", "Positive_sentence_column_Sentiment": "positive", "Positive_sentence_column_Positivity_Percentage": 61.5, "Positive_sentence_column_Negativity_Percentage": 0.0},
//             {"Sequence": 190308, "Positive_Review": "Great hotel and clean", "Positive_sentence_column_Sentiment": "positive", "Positive_sentence_column_Positivity_Percentage": 87.2, "Positive_sentence_column_Negativity_Percentage": 0.0},
//             {"Sequence": 190307, "Positive_Review": "Everything was excellent", "Positive_sentence_column_Sentiment": "positive", "Positive_sentence_column_Positivity_Percentage": 78.7, "Positive_sentence_column_Negativity_Percentage": 0.0},
//             {"Sequence": 190306, "Positive_Review": "The room was clean comfortable and reasonable value for money The staff very helpful friendly", "Positive_sentence_column_Sentiment": "positive", "Positive_sentence_column_Positivity_Percentage": 78.3, "Positive_sentence_column_Negativity_Percentage": 0.0}
//         ]
//     },
//     "rank": 1,
//     "similarity_score": 0.8220723867416382
//   }
// }
//   ''';
//
//   // Parse JSON using ReviewData.fromJson
//   Map<String, dynamic> jsonData = jsonDecode(jsonString);
//   ReviewData reviewData = ReviewData.fromJson(jsonData);
//
//   // Access the parsed data through the reviewData variable
//   print(reviewData.attributeValue['rank']);
//   print(reviewData.attributeValue['similarity_score']);
//
//   // Access and print Positive Review data
//   PositiveReviewList positiveReviewList =
//   PositiveReviewList.fromJson(reviewData.attributeValue['entire_row']['Positive_Review_Dict']);
//   positiveReviewList.printData();
// }

















// void main() {
//   // Your updated JSON string with multiple embeddings
//   String jsonString = '''
// {
//   "Positive_Review_Embeddings": [
//     {
//       "embedding": [
//         -0.34477272629737854,
//         0.21623042225837708,
//         -0.4638386368751526
//       ],
//       "sentence": "Small friendly hotel"
//     },
//     {
//       "embedding": [
//         0.123456789,
//         -0.987654321,
//         0.555555555
//       ],
//       "sentence": "Another positive sentence"
//     }
//   ]
// }
//   ''';
//
//   // Parse JSON using EmbeddingsList.fromJson
//   Map<String, dynamic> jsonData = jsonDecode(jsonString);
//   EmbeddingsList embeddingsList = EmbeddingsList.fromJson(jsonData);
//
//   // Access the parsed data through the embeddingsList variable
//   for (var embedding in embeddingsList.positiveReviewEmbeddings) {
//     print(embedding.embedding);
//     print(embedding.sentence);
//   }
// }







// void main() {
//   // Your JSON string
//   String jsonString = '''
//     {
//       "entire_row": {
//             "Average_Score_values": 7.8,
//             "Cleaned_Negative_Summmary": "The hotel is a bit further away from the main sights center than we had realized the location was not convenient the front desk area was under renovation. The front desk area was under renovation. The shower was freezing cold on dec 13 2016.",
//             "Cleaned_Positive_Summmary": "The location is very good and personel friendly. Location. The staff are very friendly and helpful. Location is very good and personel. Very good location right in the heart of the city. Needs updating. The staff were very friendly and helpful. Location is very good and personel friendly. The location is really good and makes it easy to get just about anywhere in the city the location is really central and makes it easy to get just about anywhere in the city.",
//             "Hotel_Address_values": "Viale Suzzani 13 Bicocca Zara 20162 Milan Italy",
//             "Hotel_Name_values": "Novotel Milano Nord Ca Granda",
//             "Nationalities": "[Italy]",
//             "Negative_sentence_column_Negativity_Percentage": 0.0,
//             "Negative_sentence_column_Positivity_Percentage": 49.2,
//             "Negative_sentence_column_Sentiment": "positive",
//             "Positive_Review": " Good business hotel  Great staff and facilities",
//             "Positive_Review_Dict": "[{Sequence: 497231, Positive_Review:  Good business hotel, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 59.2, Positive_sentence_column_Negativity_Percentage: 0.0}, {Sequence: 497230, Positive_Review:  Great staff and facilities, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 67.2, Positive_sentence_column_Negativity_Percentage: 0.0}]",
//             "Positive_Review_Embeddings": [
//                 {
//                     "embedding": [
//                         -0.21055014431476593,
//                         0.17724542319774628,
//                         -0.42587757110595703,
//                         0.26816606521606445,
//                         0.030076932162046432,
//                         -0.30702775716781616,
//                         0.11294809728860855,
//                         0.11711793392896652,
//                         0.3048269748687744,
//                         -0.3528883159160614,
//                         -0.20039482414722443,
//                         -0.20970191061496735,
//                         -0.3733483850955963,
//                         -0.29998525977134705,
//                         0.09045020490884781,
//                         0.18423880636692047,
//                         0.09459475427865982,
//                         -0.13699756562709808,
//                         0.10862242430448532,
//                         -0.1932607740163803,
//                         -0.3736850917339325,
//                         -0.387784868478775
//                     ],
//                     "sentence": " Good business hotel"
//                 }
//             ],
//             "Positive_sentence_column_Negativity Percentage": 0.0,
//             "Positive_sentence_column_Positivity Percentage": 59.2,
//             "Positive_sentence_column_Sentiment": "positive",
//             "Review_Date_values": "2016-05-09",
//             "Reviewer_Nationality_values": " Italy ",
//             "Reviewer_Score": 7.5,
//             "Sequence": 497231,
//             "Sequence_Number": 24059,
//             "food_grade": "A",
//             "isFavorite": "false",
//             "latitude": "45.506502000000005",
//             "longitude": "9.1965192",
//             "place_type": "Restaurants"
//         }
//     }
//   ''';
//
//   // Convert the JSON string to a map
//   Map<String, dynamic> jsonMap = json.decode(jsonString);
//
//   // Create an EntireRowData object
//   EntireRowData rowData = EntireRowData.fromJson(jsonMap);
//
//   // Print the EntireRowData object
//   print(rowData.toJson());
// }








// void main() {
//   // Your JSON string
//   String jsonString = '''
//     {
//       "entire_row": {
//             "Average_Score_values": 7.8,
//             "Cleaned_Negative_Summmary": "The hotel is a bit further away from the main sights center than we had realized the location was not convenient the front desk area was under renovation. The front desk area was under renovation. The shower was freezing cold on dec 13 2016.",
//             "Cleaned_Positive_Summmary": "The location is very good and personel friendly. Location. The staff are very friendly and helpful. Location is very good and personel. Very good location right in the heart of the city. Needs updating. The staff were very friendly and helpful. Location is very good and personel friendly. The location is really good and makes it easy to get just about anywhere in the city the location is really central and makes it easy to get just about anywhere in the city.",
//             "Hotel_Address_values": "Viale Suzzani 13 Bicocca Zara 20162 Milan Italy",
//             "Hotel_Name_values": "Novotel Milano Nord Ca Granda",
//             "Nationalities": "[Italy]",
//             "Negative_sentence_column_Negativity_Percentage": 0.0,
//             "Negative_sentence_column_Positivity_Percentage": 49.2,
//             "Negative_sentence_column_Sentiment": "positive",
//             "Positive_Review": " Good business hotel  Great staff and facilities",
//             "Positive_Review_Dict": "[{Sequence: 497231, Positive_Review:  Good business hotel, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 59.2, Positive_sentence_column_Negativity_Percentage: 0.0}, {Sequence: 497230, Positive_Review:  Great staff and facilities, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 67.2, Positive_sentence_column_Negativity_Percentage: 0.0}]",
//             "Positive_Review_Embeddings": [
//                 {
//                     "embedding": [
//                         -0.21055014431476593,
//                         0.17724542319774628,
//                         -0.42587757110595703,
//                         0.26816606521606445,
//                         0.030076932162046432,
//                         -0.13699756562709808,
//                         0.10862242430448532,
//                         -0.1932607740163803,
//                         -0.3736850917339325,
//                         -0.387784868478775
//                     ],
//                     "sentence": " Good business hotel"
//                 }
//             ],
//             "Positive_sentence_column_Negativity Percentage": 0.0,
//             "Positive_sentence_column_Positivity Percentage": 59.2,
//             "Positive_sentence_column_Sentiment": "positive",
//             "Review_Date_values": "2016-05-09",
//             "Reviewer_Nationality_values": " Italy ",
//             "Reviewer_Score": 7.5,
//             "Sequence": 497231,
//             "Sequence_Number": 24059,
//             "food_grade": "A",
//             "isFavorite": "false",
//             "latitude": "45.506502000000005",
//             "longitude": "9.1965192",
//             "place_type": "Restaurants"
//         },
//       "rank": 1,
//       "similarity_score": 0.8220723867416382
//     }
//   ''';
//
//   // Convert the JSON string to a map
//   Map<String, dynamic> jsonMap = json.decode(jsonString);
//
//   // Create a Recommendation object
//   Recommendation recommendation = Recommendation.fromJson(jsonMap);
//
//   // Print the Recommendation object
//   print(recommendation.toJson());
// }









// void main() {
//   // Your JSON string with a list of recommendations
//   String jsonString = '''
//     [
//           {
//       "entire_row": {
//             "Average_Score_values": 7.8,
//             "Cleaned_Negative_Summmary": "The hotel is a bit further away from the main sights center than we had realized the location was not convenient the front desk area was under renovation. The front desk area was under renovation. The shower was freezing cold on dec 13 2016.",
//             "Cleaned_Positive_Summmary": "The location is very good and personel friendly. Location. The staff are very friendly and helpful. Location is very good and personel. Very good location right in the heart of the city. Needs updating. The staff were very friendly and helpful. Location is very good and personel friendly. The location is really good and makes it easy to get just about anywhere in the city the location is really central and makes it easy to get just about anywhere in the city.",
//             "Hotel_Address_values": "Viale Suzzani 13 Bicocca Zara 20162 Milan Italy",
//             "Hotel_Name_values": "Novotel Milano Nord Ca Granda",
//             "Nationalities": "[Italy]",
//             "Negative_sentence_column_Negativity_Percentage": 0.0,
//             "Negative_sentence_column_Positivity_Percentage": 49.2,
//             "Negative_sentence_column_Sentiment": "positive",
//             "Positive_Review": " Good business hotel  Great staff and facilities",
//             "Positive_Review_Dict": "[{Sequence: 497231, Positive_Review:  Good business hotel, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 59.2, Positive_sentence_column_Negativity_Percentage: 0.0}, {Sequence: 497230, Positive_Review:  Great staff and facilities, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 67.2, Positive_sentence_column_Negativity_Percentage: 0.0}]",
//             "Positive_Review_Embeddings": [
//                 {
//                     "embedding": [
//                         -0.21055014431476593,
//                         0.17724542319774628,
//                         -0.42587757110595703,
//                         0.26816606521606445,
//                         0.030076932162046432,
//                         -0.13699756562709808,
//                         0.10862242430448532,
//                         -0.1932607740163803,
//                         -0.3736850917339325,
//                         -0.387784868478775
//                     ],
//                     "sentence": " Good business hotel"
//                 }
//             ],
//             "Positive_sentence_column_Negativity Percentage": 0.0,
//             "Positive_sentence_column_Positivity Percentage": 59.2,
//             "Positive_sentence_column_Sentiment": "positive",
//             "Review_Date_values": "2016-05-09",
//             "Reviewer_Nationality_values": " Italy ",
//             "Reviewer_Score": 7.5,
//             "Sequence": 497231,
//             "Sequence_Number": 24059,
//             "food_grade": "A",
//             "isFavorite": "false",
//             "latitude": "45.506502000000005",
//             "longitude": "9.1965192",
//             "place_type": "Restaurants"
//         },
//       "rank": 1,
//       "similarity_score": 0.8220723867416382
//     },
//           {
//       "entire_row": {
//             "Average_Score_values": 7.8,
//             "Cleaned_Negative_Summmary": "The hotel is a bit further away from the main sights center than we had realized the location was not convenient the front desk area was under renovation. The front desk area was under renovation. The shower was freezing cold on dec 13 2016.",
//             "Cleaned_Positive_Summmary": "The location is very good and personel friendly. Location. The staff are very friendly and helpful. Location is very good and personel. Very good location right in the heart of the city. Needs updating. The staff were very friendly and helpful. Location is very good and personel friendly. The location is really good and makes it easy to get just about anywhere in the city the location is really central and makes it easy to get just about anywhere in the city.",
//             "Hotel_Address_values": "Viale Suzzani 13 Bicocca Zara 20162 Milan Italy",
//             "Hotel_Name_values": "Novotel Milano Nord Ca Granda",
//             "Nationalities": "[Italy]",
//             "Negative_sentence_column_Negativity_Percentage": 0.0,
//             "Negative_sentence_column_Positivity_Percentage": 49.2,
//             "Negative_sentence_column_Sentiment": "positive",
//             "Positive_Review": " Good business hotel  Great staff and facilities",
//             "Positive_Review_Dict": "[{Sequence: 497231, Positive_Review:  Good business hotel, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 59.2, Positive_sentence_column_Negativity_Percentage: 0.0}, {Sequence: 497230, Positive_Review:  Great staff and facilities, Positive_sentence_column_Sentiment: positive, Positive_sentence_column_Positivity_Percentage: 67.2, Positive_sentence_column_Negativity_Percentage: 0.0}]",
//             "Positive_Review_Embeddings": [
//                 {
//                     "embedding": [
//                         -0.21055014431476593,
//                         0.17724542319774628,
//                         -0.42587757110595703,
//                         0.26816606521606445,
//                         0.030076932162046432,
//                         -0.13699756562709808,
//                         0.10862242430448532,
//                         -0.1932607740163803,
//                         -0.3736850917339325,
//                         -0.387784868478775
//                     ],
//                     "sentence": " Good business hotel"
//                 }
//             ],
//             "Positive_sentence_column_Negativity Percentage": 0.0,
//             "Positive_sentence_column_Positivity Percentage": 59.2,
//             "Positive_sentence_column_Sentiment": "positive",
//             "Review_Date_values": "2016-05-09",
//             "Reviewer_Nationality_values": " Italy ",
//             "Reviewer_Score": 7.5,
//             "Sequence": 497231,
//             "Sequence_Number": 24059,
//             "food_grade": "A",
//             "isFavorite": "false",
//             "latitude": "45.506502000000005",
//             "longitude": "9.1965192",
//             "place_type": "Restaurants"
//         },
//       "rank": 1,
//       "similarity_score": 0.8220723867416382
//     }
//     ]
//   ''';
//
//   // Convert the JSON string to a list of maps
//   List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(json.decode(jsonString));
//
//   // Create a list of Recommendation objects
//   List<Recommendation> recommendations = jsonList.map((jsonMap) => Recommendation.fromJson(jsonMap)).toList();
//
//   print(recommendations.length);
//
//   // Print the list of Recommendation objects
//   recommendations.forEach((recommendation) {
//     print(recommendation.toJson());
//   });
// }










