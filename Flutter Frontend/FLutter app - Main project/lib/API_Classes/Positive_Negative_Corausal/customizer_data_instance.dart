import '../../DartFilesForPages/ImageCarousel/customizer_class.dart';

const imageResolution= 700;
//Best settings
final settings1 = ImageCarouselSettings(
  imageUrls: [
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=1',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=2',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=3',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=4',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=5',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=6',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=7',
  ],
  widthRatio: Basic_Settings['widthRatio'],
  heightRatio: Basic_Settings['heightRatio'],
  elevation: Basic_Settings['elevation'],
  marginRatio: Basic_Settings['marginRatio'],
  initialPosition: 0.0, // Provide a custom initial position value
  margin: 8,
);

final settings2 = ImageCarouselSettings(
  imageUrls: [
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=8',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=9',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=10',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=11',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=12',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=13',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=14',
  ],
  widthRatio: Basic_Settings['widthRatio'],
  heightRatio: Basic_Settings['heightRatio'],
  elevation: Basic_Settings['elevation'],
  marginRatio: Basic_Settings['marginRatio'],
  initialPosition: 520.0, // Provide a custom initial position value (245 is the full width under above settings)
  margin: 8,
);

final positiveSummaries = ImageCarouselSettings(
  imageUrls: [
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=8',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=9',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=10',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=11',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=12',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=13',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=14',
  ],
  widthRatio: Basic_Settings['widthRatio'],
  heightRatio: 0.27/2,
  elevation: 0,
  marginRatio: 0.02,
  initialPosition: 380.0, // Provide a custom initial position value
  margin: 16,
);
final negativeSummaries = ImageCarouselSettings(
  imageUrls: [
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=15',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=16',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=17',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=18',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=19',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=20',
    'https://picsum.photos/${imageResolution}/${imageResolution}?random=21',
  ],
  widthRatio: Basic_Settings['widthRatio'],
  heightRatio: 0.27/2,
  elevation: 0,
  marginRatio: 0.02,
  initialPosition: 380.0, // Provide a custom initial position value
  margin: 16,
);