import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/gallore_menu_item.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:artist_gallore/widgets/button_arrow.dart';
import 'package:artist_gallore/widgets/text_heading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            const Align(
              alignment: Alignment.topRight,
              child: ButtonArrow(
                direction: ImageConstants.rightArrowPath,
                displayText: "show all",
              ),
            ),
          ]),
          SizedBox(
            height: 130,
            //color: Colors.cyan,
            //padding: const EdgeInsets.all(16.0),
            //alignment: Alignment.centerLeft,

            child: Scrollbar(
              trackVisibility: true,
              thumbVisibility: true,
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
    return Card(
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(width: 2, color: Colors.grey),
      ),
      child: InkWell(
        onTap: () {},
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
