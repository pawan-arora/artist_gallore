import 'package:artist_gallore/Screens/users_list_page.dart';
import 'package:artist_gallore/main.dart';
import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/gallore_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryListCard extends StatelessWidget {
  final GalloreMenuItem menuItem;
  const CategoryListCard({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onButtonClick(context),
      child: Column(children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: 25, left: 8),
          title: Text(menuItem.getName),
          leading: Image.asset(
            menuItem.getImagePath,
            height: 50,
            fit: BoxFit.contain,
          ),
          trailing: SvgPicture.asset(ImageConstants.rightArrowPath),
        ),
        const Divider(
          thickness: 2,
          color: AppTheme.color,
        ),
      ]),
    );
  }

  void onButtonClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UserListPage(
          duration: 3,
          category: menuItem.getName,
        ),
      ),
    );
  }
}
