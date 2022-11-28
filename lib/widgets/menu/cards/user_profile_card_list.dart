import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:artist_gallore/widgets/location/location_card.dart';
import 'package:flutter/material.dart';

class UserProfileCardList extends StatefulWidget {
  final Color? foregroundColor;
  final UserProfile userProfile;
  final double imageHeight;
  final double imageWidth;
  final double fontSize;

  const UserProfileCardList(
      {Key? key,
      required this.foregroundColor,
      required this.userProfile,
      required this.imageHeight,
      required this.imageWidth,
      this.fontSize = 12})
      : super(key: key);

  @override
  State<UserProfileCardList> createState() => _UserProfileCardListState();
}

class _UserProfileCardListState extends State<UserProfileCardList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.foregroundColor,
      //shadowColor: Colors.blueGrey[300],
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Image.asset(
                widget.userProfile.photo,
                height: widget.imageHeight,
                width: widget.imageWidth,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicTextStyle(
                    name: widget.userProfile.name,
                    optfontSize: widget.fontSize,
                    optFontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: _getRating(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                        BasicTextStyle(
                          name: widget.userProfile.location,
                          optfontSize: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            FittedBox(
              alignment: Alignment.topCenter,
              child: Image.asset(
                IconsContants.heartOff,
                height: 25,
                width: 25,
                fit: BoxFit.contain,
              ),
            )
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
}
