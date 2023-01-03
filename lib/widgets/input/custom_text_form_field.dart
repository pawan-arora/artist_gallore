import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final String hintText;
  final String labelText;
  final double height;
  final double width;
  final TextEditingController controller;
  final String? prefixIconPath;
  final VoidCallback onChangeFocus;
  final int maxLength;
  const CustomTextFormField(
      {Key? key,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.height,
      required this.width,
      required this.onChangeFocus,
      required this.maxLength,
      this.prefixIconPath})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _foucsNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _foucsNode.addListener(widget.onChangeFocus);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        focusNode: _foucsNode,
        cursorColor: Colors.black,
        controller: widget.controller,
        autofocus: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLength),
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ],
        style: GoogleFonts.montserrat(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            filled: true,
            hintText: widget.hintText,
            //labelText: widget.labelText,
            prefixIcon: _getPrefixIcon(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(8),
            )
            //focusColor: Colors.black,
            ),
      ),
    );
  }

  Widget? _getPrefixIcon() {
    if (widget.prefixIconPath != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ImageIcon(
          AssetImage(
            widget.prefixIconPath!,
          ),
          //size: 10,
          color: Colors.black,
        ),
      );
    } else {
      return null;
    }
  }
}
