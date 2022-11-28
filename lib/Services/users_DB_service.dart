import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/gallore_menu_item.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersDBService {
  static Future<List<UserProfile>> fetchUsersByCategory(String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentLocation = prefs.getString(GlobalDataConstants.location) ??
        GlobalDataConstants.commonLocation;

    List<UserProfile> users;

    switch (category) {
      case MenuConstants.paintingName:
        {
          users = [
            UserProfile(
                name: "Chintu",
                location: currentLocation,
                rating: 4,
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
                location: currentLocation,
                category: Category.painter,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Chinta",
                location: currentLocation,
                category: Category.painter,
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
                location: currentLocation,
                rating: 4,
                category: Category.literature,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Abhishek",
                location: currentLocation,
                category: Category.literature,
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
                location: currentLocation,
                rating: 4,
                category: Category.musician,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Garg",
                location: currentLocation,
                category: Category.musician,
                contactNumber: 9871345031,
                countryName: CountryName.india)
          ];
        }
        break;

      case MenuConstants.performingName:
        {
          users = [
            UserProfile(
                name: "Jay",
                location: currentLocation,
                rating: 4,
                category: Category.performer,
                contactNumber: 9871345031,
                countryName: CountryName.india),
            UserProfile(
                name: "Santa",
                location: currentLocation,
                category: Category.performer,
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
                location: currentLocation,
                category: Category.sculpture,
                contactNumber: 9871345031,
                countryName: CountryName.india)
          ];
        }
        break;
    }
    return users;
  }
}
