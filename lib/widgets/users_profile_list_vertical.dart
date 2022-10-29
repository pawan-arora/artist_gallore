import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/widgets/text_heading.dart';
import 'package:artist_gallore/widgets/user_profile_card.dart';
import 'package:flutter/material.dart';

class UserProfileListVertical {
  final List<UserProfile> userProfiles;
  final TextHeading heading;
  const UserProfileListVertical(
      {Key? key, required this.userProfiles, required this.heading});

  List<Widget> getGridList(BuildContext context) {
    return userProfiles
        .map((userProfile) => UserProfileCard(userProfile: userProfile))
        .toList();
  }
}
