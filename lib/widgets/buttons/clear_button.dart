import 'package:artist_gallore/main.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  //final List<TextEditingController> controllers;
  VoidCallback onButtonClick;
  ClearButton({Key? key, required this.onButtonClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          /* for (var controller in controllers) {
            controller.clear();
          } */
          onButtonClick();
        }),
        child: const BasicTextStyle(
          name: "clear",
          textColor: AppTheme.color,
        ));
  }
}
