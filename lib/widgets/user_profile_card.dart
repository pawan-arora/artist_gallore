import 'package:artist_gallore/models/user_profile.dart';
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
            Container(
              padding: const EdgeInsets.only(top: 8),
              alignment: Alignment.topLeft,
              child: Image.asset(
                widget.userProfile.photo,
                height: 70,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.sta,
              children: _getTotalRating(),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getTotalRating() {
    List<Widget> totalStars = [];
    for (var count = widget.userProfile.rating; count >= 0; count--) {
      var container = SizedBox(
        //padding: const EdgeInsets.only(top: 8),
        child: Image.asset(
          widget.userProfile.ratingPhoto,
          height: 20,
          //fit: BoxFit.contain,
        ),
      );
      totalStars.add(container);
    }
    return totalStars;
  }
}
