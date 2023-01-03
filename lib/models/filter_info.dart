import 'package:artist_gallore/models/user_profile.dart';

class FilterInfo {
  final SortBy sortBy;
  final int minHourlyRate;
  final int maxHourlyRate;
  final List<UserCategory> skills;
  final int rating;

  FilterInfo({
    this.minHourlyRate = 0,
    this.maxHourlyRate = 0,
    required this.sortBy,
    required this.skills,
    this.rating = 1,
  });
}

enum SortBy {
  mostRelevant,
  mostReviews,
  leastReview,
  highestHourlyRate,
  lowestHourlyRate,
  highestRatings,
  lowestRatings,
  distance,
}

extension SortByExtension on SortBy {
  String get name {
    switch (this) {
      case SortBy.distance:
        return "Distance";
      case SortBy.mostRelevant:
        return "Most Relevant";

      case SortBy.mostReviews:
        return "Most Reviews";

      case SortBy.leastReview:
        return "Least Reviews";

      case SortBy.highestHourlyRate:
        return "Highest Hourly Rate";

      case SortBy.lowestHourlyRate:
        return "Lowest Hourly Rate";

      case SortBy.highestRatings:
        return "Highest Ratings";

      default:
        return "Lowest Ratings";
    }
  }
}
