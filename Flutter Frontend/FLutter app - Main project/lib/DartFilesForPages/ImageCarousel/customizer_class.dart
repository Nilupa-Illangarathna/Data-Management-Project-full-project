class ImageCarouselSettings {
  final List<String> imageUrls;
  final double widthRatio;
  final double heightRatio;
  final double elevation;
  final double marginRatio;
  final double initialPosition;
  final double margin;

  ImageCarouselSettings({
    required this.imageUrls,
    required this.widthRatio,
    required this.heightRatio,
    required this.elevation,
    required this.marginRatio,
    required this.initialPosition,
    required this.margin,
  });
}

// Basic Settings
Map<String, dynamic> Basic_Settings = {
  'widthRatio': 0.27,
  'widthRatio': 0.27,
  'heightRatio': 0.27,
  'elevation': 3.0,
  'marginRatio': 0.04,
  'margin':16,
};
