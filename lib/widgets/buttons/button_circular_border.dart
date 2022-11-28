import 'package:artist_gallore/main.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:flutter/material.dart';

class ButtonCircularBorder extends StatefulWidget {
  final String name;
  const ButtonCircularBorder({Key? key, required this.name}) : super(key: key);

  @override
  State<ButtonCircularBorder> createState() => _ButtonCircularBorder();
}

class _ButtonCircularBorder extends State<ButtonCircularBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        color: AppTheme.color,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppTheme.color),
      ),
      child: Align(
        alignment: Alignment.center,
        child: BasicTextStyle(
          name: widget.name,
          textColor: Colors.white,
          optfontSize: 18,
        ),
      ),
    );
  }
}
