import 'package:flutter/material.dart';
import 'image_details_model_bottom_sheet.dart';
import 'customizer_class.dart';
import '.././../Classes/theme/theme.dart';

class ImageCarousel extends StatefulWidget {
  final ImageCarouselSettings settings;

  ImageCarousel({required this.settings});



  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {

  ThemeData get theme => Theme.of(context);
  late Color containerColor;
  bool isDarkTheme = false;


  late ScrollController _scrollController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: widget.settings.initialPosition,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSwipe(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  void _showImageDetails(BuildContext context, String imageUrl) {
    setState(() {
      // Example usage
      String photographer = 'John Doe';
      String photographyType = 'Day time photography';
      String imageId = '9615ds78';
      String image_address = imageUrl;
      String description = 'There will be instances in your career when you will need a short and an extended, more in-depth bio. Write the long bio first, then pull out the essential parts to create the short bio – one to three paragraphs for the short one and three or more paragraphs for the long version.';

      ResultModelBottomSheet(context, photographer, photographyType, imageId, image_address, description);

    });
  }

  @override
  Widget build(BuildContext context) {

    isDarkTheme = theme.brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);

    List<String> imageUrls = widget.settings.imageUrls;

    double widthRatio = widget.settings.widthRatio;
    double heightRatio = widget.settings.heightRatio;
    double elevation = widget.settings.elevation;
    // double marginRatio = widget.settings.marginRatio;
    double margin = widget.settings.margin;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * heightRatio,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => _showImageDetails(context, imageUrls[index], ),
              child: Container(
                width: MediaQuery.of(context).size.height * widthRatio,
                height: MediaQuery.of(context).size.height * heightRatio,
                margin: EdgeInsets.only(
                  // right: MediaQuery.of(context).size.width * marginRatio,
                  right: margin,
                ),
                child: Card(
                  margin: EdgeInsets.fromLTRB(16, 0, 4, 8),
                  elevation: elevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.height * widthRatio,
                        height: MediaQuery.of(context).size.height * heightRatio * 7/10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10.0),),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10.0),),
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * widthRatio,
                        height: MediaQuery.of(context).size.height * heightRatio * 3/10 -8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10.0),),
                          color: containerColor,
                        ),

                      ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
