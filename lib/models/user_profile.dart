import 'package:artist_gallore/models/constants.dart';

class UserProfile {
  final String name;
  final String location;
  final Category category;
  final int rating;
  final String ratingPhoto;
  final String photo;
  final int contactNumber;
  final CountryName countryName;
  bool isSelected = false;

  UserProfile({
    required this.name,
    required this.category,
    this.rating = 1,
    required this.location,
    this.photo = "assets/images/no_picture.png",
    this.ratingPhoto = "assets/images/star-rating.png",
    required this.contactNumber,
    required this.countryName,
  });
}

enum Category {
  painter,
  sculpture,
  literature,
  musician,
  performer,
}

class CountryCodes {
  static const int india = 91;
  static const int pakistan = 92;
  static const int japan = 81;
  static const int china = 86;
  static const int bhutan = 975;
  static const int bangladesh = 880;
  static const int nepal = 977;
  static const int srilanka = 94;
}

enum CountryName {
  india,
  pakistan,
  japan,
  china,
  bhutan,
  bangladesh,
  nepal,
  srilanka
}
