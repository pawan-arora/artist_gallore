import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicTextStyle extends StatelessWidget {
  final String name;
  final double? optfontSize;
  final double fontSize = 20;
  final FontWeight? optFontWeight;
  final Color textColor;
  const BasicTextStyle(
      {Key? key,
      required this.name,
      this.optfontSize,
      this.optFontWeight,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        fontSize: optfontSize ?? fontSize,
        color: textColor,
        fontWeight: optFontWeight ?? FontWeight.normal,
      ),
    );
  }
}
