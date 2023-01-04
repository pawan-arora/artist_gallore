import 'package:country_codes/country_codes.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';

class LocationService {
  final void Function(String) onLocationChange;
  LocationService({required this.onLocationChange});
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final CountryDetails _details = CountryCodes.detailsForLocale();

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  void getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      onLocationChange(_details.name ?? "");
    } else {
      final position = await _geolocatorPlatform.getCurrentPosition();
      _getAddress(position.latitude, position.longitude).then((value) {
        onLocationChange(value);
      });
    }
  }

  Future<String> _getAddress(double? lat, double? lang) async {
    if (lat == null || lang == null) return "";

    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);

    return "${placemarks[0].locality}, ${placemarks[0].country}";
  }
}
