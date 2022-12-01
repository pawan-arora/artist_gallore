import 'package:artist_gallore/Screens/category_page.dart';
import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/gallore_menu_item.dart';
import 'package:artist_gallore/widgets/buttons/button_arrow.dart';
import 'package:artist_gallore/widgets/menu/cards/menu_list_horizontal_card.dart';
import 'package:artist_gallore/styles/text_heading.dart';
import 'package:flutter/material.dart';

class MenuListHorizontalScroll {
  final List<GalloreMenuItem> items;
  final TextHeading heading;
  const MenuListHorizontalScroll({required this.items, required this.heading});

  //@override
  Widget getGridList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2, top: 5),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: heading,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ButtonArrow(
                direction: ImageConstants.rightArrowPath,
                displayText: MenuConstants.buttonText,
                onArrowButtonClick: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CategoryPage(title: "Categories", items: items),
                    ),
                  );
                }),
              ),
            ),
          ]),
          SizedBox(
            height: 130,
            //color: Colors.cyan,
            //padding: const EdgeInsets.all(16.0),
            //alignment: Alignment.centerLeft,

            child: Scrollbar(
              //isAlwaysShown: false,
              //trackVisibility: true,
              thumbVisibility: false,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _gridTile(items[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gridTile(GalloreMenuItem menuItem) {
    return MenuListHorizontalCard(menuItem: menuItem);
  }
}
