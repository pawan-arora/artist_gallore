import 'package:artist_gallore/main.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTile extends StatefulWidget {
  final String categoryName;
  final bool isChecked;
  const CustomCheckBoxTile(
      {Key? key, required this.categoryName, this.isChecked = false})
      : super(key: key);

  @override
  State<CustomCheckBoxTile> createState() => CustomCheckBoxTileState();
}

class CustomCheckBoxTileState extends State<CustomCheckBoxTile> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  void unCheck() {
    setState(() {
      _isChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: BasicTextStyle(
        name: _makeFirtLetterCapital(widget.categoryName),
        optfontSize: 14,
      ),
      value: _isChecked,
      onChanged: (newValue) {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      checkColor: Colors.white,
      activeColor: AppTheme.color,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  String _makeFirtLetterCapital(String category) {
    return category[0].toUpperCase() + category.substring(1, category.length);
  }
}
