import 'package:artist_gallore/events/rating_change_event.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class DynamicText extends StatefulWidget {
  final String text;
  final double fontSize;
  final EventBus eventBus;
  const DynamicText(
      {Key? key,
      required this.text,
      required this.eventBus,
      this.fontSize = 12})
      : super(key: key);

  @override
  State<DynamicText> createState() => _DynamicTextState();
}

class _DynamicTextState extends State<DynamicText> {
  late String _text;

  @override
  void initState() {
    super.initState();
    _text = widget.text;
    widget.eventBus.on<RatingChangeEvent>().listen((event) {
      updateText(event.rating.toString());
    });
  }

  void updateText(String newText) {
    setState(() {
      _text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasicTextStyle(
      name: _text,
      optfontSize: widget.fontSize,
    );
  }
}
