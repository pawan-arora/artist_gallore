import 'package:artist_gallore/Services/users_DB_service.dart';
import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavouriteButton extends StatefulWidget {
  void Function()? onButtonClick;
  final UserProfile userProfile;
  FavouriteButton({Key? key, required this.userProfile, this.onButtonClick})
      : super(key: key);

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  //bool _isSelected = widget.userProfile.isSelected;
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.userProfile.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.userProfile.isSelected = _isSelected;
          if (_isSelected) {
            UsersDBService.addSelectedUserInFavorites(widget.userProfile);
          } else {
            UsersDBService.removeSelectedUserFromFavorites(widget.userProfile);
          }
          widget.onButtonClick?.call();
        });
      },
      child: FittedBox(
        alignment: Alignment.topCenter,
        child: _getImage(),
      ),
    );
  }

  Widget _getImage() {
    if (widget.userProfile.isSelected) {
      return Image.asset(
        IconsContants.heartOn,
        height: 25,
        width: 25,
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        IconsContants.heartOff,
        height: 25,
        width: 25,
        fit: BoxFit.contain,
      );
    }
  }
}
