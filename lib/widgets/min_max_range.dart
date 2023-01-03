import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:artist_gallore/widgets/input/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MinMaxRange extends StatelessWidget {
  final String rangeStartText;
  final String rangeEndText;
  final String minHintText;
  final String maxHintText;
  final double height;
  final double width;
  final String? prefixIconPath;
  final int? maxLength;
  final int? minLength;
  final Function(bool) onChangeFocus;
  final int defaultLength;

  const MinMaxRange(
      {Key? key,
      required this.minRateController,
      required this.maxRateController,
      required this.rangeEndText,
      required this.rangeStartText,
      required this.minHintText,
      required this.maxHintText,
      required this.height,
      required this.width,
      required this.onChangeFocus,
      this.maxLength,
      this.minLength,
      this.defaultLength = 6,
      this.prefixIconPath})
      : super(key: key);

  final TextEditingController minRateController;
  final TextEditingController maxRateController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicTextStyle(
              name: rangeStartText,
              optfontSize: 12,
              optFontWeight: FontWeight.bold,
            ),
            CustomTextFormField(
              hintText: minHintText,
              labelText: minHintText,
              height: height,
              width: width,
              maxLength: minLength ?? defaultLength,
              onChangeFocus: () => onChangeFocus(true),
              controller: minRateController,
              prefixIconPath: prefixIconPath,
            ),
          ],
        ),
        const BasicTextStyle(name: "to"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicTextStyle(
                name: rangeEndText,
                optfontSize: 12,
                optFontWeight: FontWeight.bold),
            CustomTextFormField(
              hintText: maxHintText,
              labelText: maxHintText,
              height: height,
              width: width,
              maxLength: maxLength ?? defaultLength,
              controller: maxRateController,
              onChangeFocus: () => onChangeFocus(false),
              prefixIconPath: prefixIconPath,
            ),
          ],
        ),
      ],
    );
  }
}
