import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:artist_gallore/widgets/custom_tooltip.dart';
import 'package:artist_gallore/widgets/location/location_card.dart';
import 'package:flutter/material.dart';

class UserProfileCard extends StatefulWidget {
  final UserProfile userProfile;
  const UserProfileCard({Key? key, required this.userProfile})
      : super(key: key);

  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      shadowColor: Colors.blueGrey[300],
      elevation: 10,
      child: SizedBox(
        //height: 50,
        //width: 50,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  FittedBox(
                    child: Image.asset(
                      widget.userProfile.photo,
                      height: 90,
                      width: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomTooltip(
                      name: widget.userProfile.category.name,
                      category: widget.userProfile.category,
                      iconHeight: 20,
                      iconWidth: 25),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 5, left: 12),
              child: BasicTextStyle(
                name: widget.userProfile.name,
                optfontSize: 14,
                optFontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: _getRating(),
              ),
            ),
            LocationCard(
              location: widget.userProfile.location,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getRating() {
    List<Widget> stars = [];
    for (var count = widget.userProfile.rating; count > 0; count--) {
      var star = Image.asset(
        widget.userProfile.ratingPhoto,
        height: 20,
        //fit: BoxFit.contain,
      );
      stars.add(star);
    }
    return stars;
  }

  List<Widget> _getLocation() {
    List<Widget> locations = [];

    return locations;
  }
}
