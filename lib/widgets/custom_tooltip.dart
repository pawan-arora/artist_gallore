import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  final String name;
  final UserCategory category;
  final double iconHeight;
  final double iconWidth;
  const CustomTooltip(
      {Key? key,
      required this.name,
      required this.category,
      required this.iconHeight,
      required this.iconWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: name,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: _getCategoryIcon(),
      ),
    );
  }

  Image _getCategoryIcon() {
    switch (category) {
      case UserCategory.painter:
        return Image.asset(
          ImageConstants.paintingPath,
          height: iconHeight,
          width: iconWidth,
        );

      case UserCategory.sculpture:
        return Image.asset(
          ImageConstants.sculpturePath,
          height: iconHeight,
          width: iconWidth,
        );

      case UserCategory.musician:
        return Image.asset(
          ImageConstants.musicPath,
          height: iconHeight,
          width: iconWidth,
        );

      case UserCategory.performer:
        return Image.asset(
          ImageConstants.performingPath,
          height: iconHeight,
          width: iconWidth,
        );

      default:
        return Image.asset(
          ImageConstants.literaturePath,
          height: iconHeight,
          width: iconWidth,
        );
    }
  }
}
