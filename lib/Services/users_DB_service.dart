import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersDBService {
  static final Map<String, List<UserProfile>> _selectedUsers = {};
  static final List<UserProfile> _favouriteUsers = List.empty(growable: true);

  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<void> addSelectedUserInFavorites(
      UserProfile userProfile) async {
    _favouriteUsers.add(userProfile);
  }

  static Future<bool> removeSelectedUserFromFavorites(
      UserProfile userProfile) async {
    return _favouriteUsers.remove(userProfile);
  }

  static Future<List<UserProfile>> fetchFavorites() {
    return Future.value(_favouriteUsers);
  }

  static Future<List<UserProfile>> fetchUsersByCategory(String category) async {
    if (_selectedUsers.isNotEmpty && _selectedUsers.containsKey(category)) {
      return _selectedUsers[category]!;
    } else {
      return await _getNewUserByCategory(category);
    }
  }

  static Future<List<UserProfile>> _getNewUserByCategory(
      String category) async {
    SharedPreferences prefs = await _prefs;
    String currentLocation = prefs.getString(GlobalDataConstants.location) ??
        GlobalDataConstants.commonLocation;

    List<UserProfile> users;
    switch (category) {
      case MenuConstants.paintingName:
        {
          users = [
            UserProfile(
                name: "Chintu",
                rating: 4,
                location: currentLocation,
                category: Category.painter,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Chinta",
                location: currentLocation,
                category: Category.painter,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Chintu",
                category: Category.painter,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Chinta",
                category: Category.painter,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Chintu",
                category: Category.painter,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Chinta",
                category: Category.painter,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india)
          ];
        }
        break;

      case MenuConstants.literatureName:
        {
          users = [
            UserProfile(
                name: "Rahul",
                rating: 4,
                category: Category.literature,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Abhishek",
                category: Category.literature,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india)
          ];
        }
        break;

      case MenuConstants.musicName:
        {
          users = [
            UserProfile(
                name: "Diship",
                rating: 4,
                category: Category.musician,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Garg",
                category: Category.musician,
                contactNumber: 9871345031,
                location: currentLocation,
                countryName: CountryName.india)
          ];
        }
        break;

      case MenuConstants.performingName:
        {
          users = [
            UserProfile(
                name: "Jay",
                rating: 4,
                category: Category.performer,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Santa",
                category: Category.performer,
                location: currentLocation,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Banta",
                location: currentLocation,
                category: Category.performer,
                contactNumber: 9871345031,
                countryName: CountryName.india)
          ];
        }
        break;

      default:
        {
          users = [
            UserProfile(
                name: "Sculpture_1",
                location: currentLocation,
                rating: 4,
                category: Category.sculpture,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Sculpture_2",
                location: currentLocation,
                category: Category.sculpture,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Sculpture_3",
                category: Category.sculpture,
                contactNumber: 9871345031,
                location: currentLocation,
                countryName: CountryName.india)
          ];
        }
        break;
    }
    _selectedUsers.putIfAbsent(category, () => users);
    return users;
  }
}
