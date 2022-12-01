import 'package:artist_gallore/models/gallore_menu_item.dart';
import 'package:artist_gallore/styles/text_heading.dart';
import 'package:artist_gallore/widgets/menu/cards/category_list_card.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  final List<GalloreMenuItem> items;

  const CategoryPage({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextHeading(title: title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CategoryListCard(title: items[index].getName);
        },
        itemCount: items.length,
      ),
    );
  }
}
