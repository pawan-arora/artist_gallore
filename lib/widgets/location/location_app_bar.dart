import 'package:artist_gallore/Screens/location_select_page.dart';
import 'package:artist_gallore/Services/location_service.dart';
import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:artist_gallore/widgets/buttons/button_arrow.dart';
import 'package:artist_gallore/widgets/circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationAppBar extends StatefulWidget {
  final PageTransitionType pageTransition;
  final int duration;

  const LocationAppBar(
      {Key? key, required this.pageTransition, required this.duration})
      : super(key: key);

  @override
  State<LocationAppBar> createState() => _LocationAppBarState();
} 

class _LocationAppBarState extends State<LocationAppBar> {
  late LocationService service;
  late String _currentLocation;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = true;

  void onlocationChange(String location) {
    updateLocation(location).then((value) {
      setState(() {
        _currentLocation = location;
        _isLoading = false;
      });
    });
  }

  Future<void> updateLocation(String location) async {
    SharedPreferences pref = await _prefs;
    pref.setString(GlobalDataConstants.location, location);
  }

  @override
  void initState() {
    service = LocationService(onLocationChange: onlocationChange);
    
    super.initState();
    service.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              type: widget.pageTransition,
              child: LocationSelectPage(),
              duration: Duration(milliseconds: widget.duration),
            ));
      },
      child: Row(children: [
        _isLoading
            ? const CustomCircularProgressBar()
            : SizedBox(
                width: 120,
                child: BasicTextStyle(
                  name: _currentLocation,
                  optfontSize: 14,
                ),
              ),
        ButtonArrow(
          direction: ImageConstants.rightArrowPath,
          iconData: Icons.location_on,
          onArrowButtonClick: () {
            Navigator.push(
                context,
                PageTransition(
                  type: widget.pageTransition,
                  child: LocationSelectPage(),
                  duration: Duration(milliseconds: widget.duration),
                ));
          },
        ),
      ]),
    );
  }
}
