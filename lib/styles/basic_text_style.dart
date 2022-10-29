import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicTextStyle extends StatelessWidget {
  final String name;
  final double? optfontSize;
  final double fontSize = 20;
  final FontWeight? optFontWeight;

  const BasicTextStyle(
      {Key? key, required this.name, this.optfontSize, this.optFontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.montserrat(
        fontSize: optfontSize ?? fontSize,
        fontWeight: optFontWeight ?? FontWeight.normal,
      ),
    );
  }
}
