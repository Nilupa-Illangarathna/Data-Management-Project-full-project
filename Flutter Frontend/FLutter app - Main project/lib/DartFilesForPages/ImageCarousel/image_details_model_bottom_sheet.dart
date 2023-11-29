import 'package:flutter/material.dart';

void ResultModelBottomSheet(BuildContext ctx, String photographer, String photographyType, String imageId, String imageUrl, String description) {


  late Color containerColor;
  bool isDarkTheme = false;

  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    context: ctx,
    backgroundColor: Colors.transparent,
    builder: (_) {
      isDarkTheme = Theme.of(ctx).brightness == Brightness.dark;
      double screenWidth = MediaQuery.of(ctx).size.width;
      containerColor = isDarkTheme
          ? Colors.black.withOpacity(0.3)
          : Theme.of(ctx).primaryColor.withOpacity(0.15);

      return Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  height: 130,
                  margin: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                margin: EdgeInsets.only(top: 8.0, left: 0.0, right: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  margin: EdgeInsets.all(0.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Photographer', style: TextStyle(fontSize: 20, color: Colors.black45)),
                        Text(photographyType, style: TextStyle(fontSize: 14, color: Colors.white60)),
                        Text('#$imageId', style: TextStyle(fontSize: 12, color: Colors.black45.withOpacity(0.4))),
                        SizedBox(height: 10),
                        Text(description, style: TextStyle(fontSize: 12, color: Colors.black45.withOpacity(0.6))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
