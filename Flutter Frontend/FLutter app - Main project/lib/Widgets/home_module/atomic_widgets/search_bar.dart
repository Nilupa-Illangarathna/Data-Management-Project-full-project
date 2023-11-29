import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Widgets/home_module/molecule_widgets/search.dart';

class VoiceSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function onSearch;

  VoiceSearchBar({
    required this.controller,
    required this.onSearch,
  });

  @override
  State<VoiceSearchBar> createState() => _VoiceSearchBarState();
}

class _VoiceSearchBarState extends State<VoiceSearchBar> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  void searchPageNavigator() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => TopCategoriesSearch(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);

    return Flexible(
      child: GestureDetector(
        onTap: () {

          // Perform the navigation to search function here
          searchPageNavigator();
        },
        child: Container(
          height:40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: "Explore more",
                  hintStyle: TextStyle(
                    fontSize: 13 * HR,
                    color: isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.65),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      // Call the voice input function when the mic button is pressed
                      // You can implement this function in the parent widget.
                      searchPageNavigator();
                      widget.onSearch();
                    },
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the navigation to search function here
                      searchPageNavigator();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
