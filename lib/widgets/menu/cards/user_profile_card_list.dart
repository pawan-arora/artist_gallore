import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:artist_gallore/widgets/buttons/favourite_button.dart';
import 'package:artist_gallore/widgets/custom_tooltip.dart';
import 'package:flutter/material.dart';

class UserProfileCardList extends StatefulWidget {
  final Color? foregroundColor;
  final UserProfile userProfile;
  final double imageHeight;
  final double imageWidth;
  final double fontSize;
  void Function()? onFavouriteButtonClick;

  UserProfileCardList(
      {Key? key,
      required this.foregroundColor,
      required this.userProfile,
      required this.imageHeight,
      required this.imageWidth,
      this.onFavouriteButtonClick,
      this.fontSize = 12})
      : super(key: key);

  @override
  State<UserProfileCardList> createState() => _UserProfileCardListState();
}

class _UserProfileCardListState extends State<UserProfileCardList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.foregroundColor,
      shadowColor: Colors.blueGrey[300],
      elevation: 4,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                FittedBox(
                  child: Image.asset(
                    widget.userProfile.photo,
                    height: widget.imageHeight,
                    width: widget.imageWidth,
                    fit: BoxFit.contain,
                  ),
                ),
                CustomTooltip(
                    name: widget.userProfile.category.name,
                    category: widget.userProfile.category,
                    iconHeight: 20,
                    iconWidth: 25),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicTextStyle(
                    name: widget.userProfile.name,
                    optfontSize: widget.fontSize,
                    optFontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: _getRating(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                        BasicTextStyle(
                          name: widget.userProfile.location,
                          optfontSize: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            FavouriteButton(
              userProfile: widget.userProfile,
              onButtonClick: widget.onFavouriteButtonClick,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getRating() {
    List<Widget> stars = [];
    for (var count = widget.userProfile.rating; count > 0; count--) {
      var star = Image.asset(
        widget.userProfile.ratingPhoto,
        height: 20,
        //fit: BoxFit.contain,
      );
      stars.add(star);
    }
    return stars;
  }
}
