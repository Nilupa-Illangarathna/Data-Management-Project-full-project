import 'package:flutter/material.dart';
import 'package:main_app/Widgets/home_module/atomic_widgets/animated_image.dart';
import '/API_Classes/global_applications/global_applications.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/Widgets/home_module/atomic_widgets/conditional_image.dart';

class HotelRecommendationCard extends StatefulWidget {
  final String imageUrl;
  final String rating;
  final String name;
  final String address;
  final VoidCallback onClick;

  HotelRecommendationCard({
    required this.imageUrl,
    required this.rating,
    required this.name,
    required this.address,
    required this.onClick,
  });

  @override
  State<HotelRecommendationCard> createState() =>
      _HotelRecommendationCardState();
}

class _HotelRecommendationCardState extends State<HotelRecommendationCard>
    with SingleTickerProviderStateMixin {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  final double scaleFactor = 0.95; // Adjust this scale factor as needed

  late AnimationController _controller;
  late Animation<double> _animation;

  bool isOverlayVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // You can choose any curve from the Curves class
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 2000), () {
          setState(() {
            isOverlayVisible = false;
          });
          _controller.reset();
        });
      }
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme
        ? Colors.black.withOpacity(0.3)
        : theme.primaryColor.withOpacity(0.15);

    return InkWell(
      onTap: () {
        setState(() {
          isOverlayVisible = true;
        });

        _controller.forward();
        widget.onClick();
      },
      child: Container(
        height: 300 * HR,
        width: 204 * HR,
        margin: EdgeInsets.only(right: 8 * WR),
        child: ClipRect(
          child: Stack(
            children: [
              Container(
                height: 300 * HR,
                width: 204 * HR,
                decoration: BoxDecoration(
                  color: containerColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              Container(
                height: 300 * HR,
                width: 196 * HR,
                decoration: BoxDecoration(
                  color: containerColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              Container(
                height: 300 * HR,
                width: 188 * HR,
                decoration: BoxDecoration(
                  color: containerColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 290 / 1 * HR,
                        width: 200 / 1.1 * WR * scaleFactor,
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                _buildCardHotels(widget.imageUrl),
                              ],
                            ),
                            SizedBox(height: 10 * HR * scaleFactor),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: _buildHotelDetails(
                                limitTextWithEllipsis(widget.name, 16),
                                limitTextWithEllipsis(widget.address, 24),
                              ),
                            ),
                            SizedBox(height: 10 * HR * scaleFactor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned.fill(
                child: Visibility(
                  visible: isOverlayVisible,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          (_animation.value) * 204 / 1.1 * WR,
                          0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/Homescreen/Random_Vector_Images/plane.png',
                                  height: 260 * HR,
                                  width: 204 * WR ,
                                  fit: BoxFit.contain,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDarkTheme? Colors.black.withOpacity(0.5) :containerColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16.0),

                                  ),
                                )
                              ],
                            ),
                            // AnimatedImageContainer(
                            //   assetAddress: 'assets/Homescreen/Random_Vector_Images/plane.png',
                            //   containerWidth: 204, // Adjust the width as needed
                            //   containerHeight: 300, // Adjust the height as needed
                            //   imageWidthFactor: 1.1, // Adjust the factor as needed
                            //   startAnimation: isOverlayVisible,
                            // ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardHotels(String imageUrl) {
    return Container(
      width: 180 / 1.1 * WR * scaleFactor,
      height: 204 / 1.1 * HR * scaleFactor,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: ConditionalImage(
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  Widget _buildFilterChip(String rating, BuildContext context) {
    return FilterChip(
      labelPadding: EdgeInsets.all(0),
      label: Padding(
        padding: EdgeInsets.fromLTRB(
          8.5 * WR * scaleFactor,
          4 * HR * scaleFactor,
          8.5 * WR * scaleFactor,
          4 * HR * scaleFactor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: isDarkTheme
                  ? Colors.grey.withOpacity(0.7)
                  : theme.primaryColor.withOpacity(0.75),
              size: 14 * HR * scaleFactor,
            ),
            SizedBox(width: 4 * WR * scaleFactor),
            Text(
              rating,
              style: TextStyle(
                fontSize: 12 * HR * scaleFactor,
                fontWeight: FontWeight.w600,
                color: isDarkTheme
                    ? Colors.grey.withOpacity(0.7)
                    : theme.primaryColor.withOpacity(0.75),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      onSelected: (isSelected) {},
      selected: false,
      selectedColor: Colors.green,
      checkmarkColor: Colors.white,
    );
  }

  Widget _buildHotelDetails(String name, String address) {
    return Container(
      height: 38 * HR * scaleFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 20 * HR * scaleFactor,
              fontWeight: FontWeight.w400,
              color: isDarkTheme
                  ? Colors.grey.withOpacity(0.7)
                  : theme.focusColor.withOpacity(0.65),
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            address,
            style: TextStyle(
              fontSize: 12 * HR * scaleFactor,
              fontWeight: FontWeight.w300,
              fontFamily: 'SF Pro',
              color: isDarkTheme
                  ? Colors.grey.withOpacity(0.7)
                  : theme.focusColor.withOpacity(0.65),
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
