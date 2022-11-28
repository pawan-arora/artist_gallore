import 'package:flutter/cupertino.dart';

@immutable
class ArtsCategory {
  final String name;
  final String path;

  const ArtsCategory({required this.name, required this.path});

  String get getName {
    return name;
  }

  String get getPath {
    return path;
  }
}
