import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/widgets/cards/user_profile_card.dart';
import 'package:flutter/material.dart';

class UserProfileListVertical {
  final List<UserProfile> userProfiles;
  const UserProfileListVertical({Key? key, required this.userProfiles});

  List<Widget> generateGrid(BuildContext context) {
    return userProfiles
        .map((userProfile) => UserProfileCard(userProfile: userProfile))
        .toList();
  }
}
