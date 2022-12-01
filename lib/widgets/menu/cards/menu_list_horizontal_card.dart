import 'package:artist_gallore/Screens/users_list_page.dart';
import 'package:artist_gallore/models/gallore_menu_item.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:flutter/material.dart';

class MenuListHorizontalCard extends StatelessWidget {
  final GalloreMenuItem menuItem;
  const MenuListHorizontalCard({Key? key, required this.menuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(width: 2, color: Colors.grey),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => UserListPage(
                duration: 3,
                category: menuItem.getName,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset(
                menuItem.getImagePath,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: BasicTextStyle(
                name: menuItem.getName,
                optfontSize: 20,
                optFontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
