import 'package:artist_gallore/main.dart';
import 'package:artist_gallore/styles/multi_style_text.dart';
import 'package:artist_gallore/styles/text_heading.dart';
import 'package:flutter/material.dart';

class LocationLeadingButton extends StatelessWidget {
  final String category;
  final String location;
  const LocationLeadingButton({
    Key? key,
    required this.category,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topLeft,
      //alignment: ,
      //height: boxHeight,
      margin: const EdgeInsets.only(bottom: 5.0, right: 0, top: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppTheme.color),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          InkWell(
            child: MultiStyleText(
              text: category,
              fontWeight: FontWeight.bold,
              multilines: [
                TextLine(text: " in ", fontWeight: FontWeight.normal),
                TextLine(text: location, fontWeight: FontWeight.normal),
              ],
            ),
          )
        ],
      ),
    );
  }
}
