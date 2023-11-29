import 'package:flutter/material.dart';

class ReviewSummaryView extends StatefulWidget {
  final List<Widget> pages;

  ReviewSummaryView({required this.pages});

  @override
  _ReviewSummaryViewState createState() => _ReviewSummaryViewState();
}

class _ReviewSummaryViewState extends State<ReviewSummaryView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleSwipe(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Disable horizontal dragging
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.33,

        decoration: BoxDecoration(
            // color: containerColor,
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _handleSwipe,
                physics: ClampingScrollPhysics(), // Apply custom physics
                itemBuilder: (context, index) {

                  return SingleChildScrollView(
                    // physics: BouncingScrollPhysics(), // Disable scrolling for child page
                    child: Container(
                      width: double.infinity,
                      // color: Colors.primaries[_currentPageIndex % Colors.primaries.length], ///////////////////////////////////With this we can select a random colur to be used from colors class //////////////////
                      color: Colors.transparent,
                      padding: EdgeInsets.only(bottom: 0,top: 0, left: 0, right: 0),
                      child: widget.pages[index],
                    ),
                  );
                },
                itemCount: widget.pages.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomScrollPhysics extends PageScrollPhysics {
  // Override applyPhysicsToUserOffset method to disable horizontal scrolling
  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset.clamp(-position.extentBefore, position.extentInside);
  }
}
