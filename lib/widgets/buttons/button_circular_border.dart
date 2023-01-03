import 'package:artist_gallore/main.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:flutter/material.dart';

class ButtonCircularBorder extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final double borderCircularRadius;
  final double fontSize;
  final VoidCallback onButtonClick;

  const ButtonCircularBorder(
      {Key? key,
      required this.name,
      this.height,
      this.width,
      this.fontSize = 18,
      this.borderCircularRadius = 2,
      required this.onButtonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonClick,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppTheme.color,
          borderRadius: BorderRadius.circular(borderCircularRadius),
          border: Border.all(color: AppTheme.color),
        ),
        child: Align(
          alignment: Alignment.center,
          child: BasicTextStyle(
            name: name,
            textColor: Colors.white,
            optfontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
