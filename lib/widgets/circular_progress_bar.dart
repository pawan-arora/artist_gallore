import 'package:flutter/material.dart';

class CustomCircularProgressBar extends StatefulWidget {
  const CustomCircularProgressBar({Key? key}) : super(key: key);

  @override
  State<CustomCircularProgressBar> createState() =>
      _CustomCircularProgressBarState();
}

class _CustomCircularProgressBarState extends State<CustomCircularProgressBar> {
  late ValueNotifier<double> _valueNotifier;

  final centerTextStyle = const TextStyle(
    fontSize: 64,
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation(
          Colors.cyan,
        ),
        strokeWidth: 8);
  }
}
