import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  final String name;
  final Category category;
  final double iconHeight;
  final double iconWidth;
  const CustomTooltip({Key? key, required this.name, required this.category, required this.iconHeight, required this.iconWidth})
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
      case Category.painter:
        return Image.asset(
          ImageConstants.paintingPath,
          height: iconHeight,
          width: iconWidth,
        );

      case Category.sculpture:
        return Image.asset(
          ImageConstants.sculpturePath,
          height: iconHeight,
          width: iconWidth,
        );

      case Category.musician:
        return Image.asset(
          ImageConstants.musicPath,
          height: iconHeight,
          width: iconWidth,
        );

      case Category.performer:
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
