import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiStyleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final List<TextLine> multilines;

  const MultiStyleText(
      {Key? key,
      required this.text,
      this.fontSize = 12,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      required this.multilines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: text,
          style: GoogleFonts.montserrat(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
          children: _getMultiLinesText()),
    );
  }

  List<TextSpan> _getMultiLinesText() {
    List<TextSpan> textSpan = [];
    for (var textLine in multilines) {
      textSpan.add(TextSpan(
          text: textLine.text,
          style: GoogleFonts.montserrat(fontWeight: textLine.fontWeight)));
    }
    return textSpan;
  }
}

class TextLine {
  final String text;
  final FontWeight fontWeight;

  TextLine({required this.text, required this.fontWeight});
}
