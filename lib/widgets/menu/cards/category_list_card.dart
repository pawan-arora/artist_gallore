import 'package:artist_gallore/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryListCard extends StatelessWidget {
  final String title;
  
  const CategoryListCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      tileColor: Colors.red,
      trailing: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(ImageConstants.rightArrowPath),
        constraints: const BoxConstraints(),
      ),
    );
  }
}
