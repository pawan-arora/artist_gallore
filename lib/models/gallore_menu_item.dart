class GalloreMenuItem {
  final String imagePath;
  final String name;
  final double size;

  GalloreMenuItem(
      {required this.imagePath, required this.name, this.size = 44.0});

  String get getImagePath {
    return imagePath;
  }

  String get getName {
    return name;
  }

  double get getSize {
    return size;
  }
}
