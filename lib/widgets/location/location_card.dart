import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final double leftPadding;
  final double topPadding;
  final double fontSize;
  final String location;

  const LocationCard(
      {Key? key,
      required this.location,
      this.leftPadding = 8,
      this.topPadding = 10,
      this.fontSize = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, top: topPadding),
      child: Row(
        children: [
          const Icon(Icons.location_on),
          Expanded(
            flex: 1,
            child: BasicTextStyle(
              name: location,
              optfontSize: fontSize,
            ),
          )
        ],
      ),
    );
  }
}
