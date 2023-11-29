import 'package:flutter/material.dart';

class HorizontalPageView extends StatefulWidget {
  final List<Widget> pages;

  HorizontalPageView({required this.pages});

  @override
  _HorizontalPageViewState createState() => _HorizontalPageViewState();
}

class _HorizontalPageViewState extends State<HorizontalPageView> {
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
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.pages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentPageIndex = index;
                          _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      child: Text(
                        'Page ${index + 1}',
                        style: TextStyle(
                          color: _currentPageIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: _currentPageIndex == index
                            ? Colors.blue
                            : Colors.grey[300],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _handleSwipe,
                physics: CustomScrollPhysics(), // Apply custom physics
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    // physics: BouncingScrollPhysics(), // Disable scrolling for child page
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      child: Container(
                        width: double.infinity,
                        // color: Colors.primaries[_currentPageIndex % Colors.primaries.length], ///////////////////////////////////With this we can select a random colur to be used from colors class //////////////////
                        color: Colors.grey.shade300,
                        padding: EdgeInsets.only(bottom: 16,top: 64, left: 0, right: 0),
                        child: widget.pages[index],
                      ),
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
