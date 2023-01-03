import 'package:artist_gallore/events/rating_change_event.dart';
import 'package:artist_gallore/models/filter_info.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:artist_gallore/styles/dynamic_text.dart';
import 'package:artist_gallore/styles/text_heading.dart';
import 'package:artist_gallore/widgets/buttons/button_circular_border.dart';
import 'package:artist_gallore/widgets/buttons/clear_button.dart';
import 'package:artist_gallore/widgets/buttons/drop_down_sort_by_button.dart';
import 'package:artist_gallore/widgets/custom_check_box_tile.dart';
import 'package:artist_gallore/widgets/min_max_range.dart';
import 'package:artist_gallore/widgets/rating.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  final FilterInfo filterInfo;
  final String title;
  const FilterPage({Key? key, required this.title, required this.filterInfo})
      : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  TextEditingController minRateController = TextEditingController();
  TextEditingController maxRateController = TextEditingController();
  TextEditingController minReviewController = TextEditingController();
  TextEditingController maxReviewController = TextEditingController();
  EventBus eventBus = EventBus();
  List<GlobalKey<CustomCheckBoxTileState>> checkBoxKeys =
      List.empty(growable: true);
  List<GlobalKey<RatingState>> ratingKeys = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    //context.findRenderObject() as RenderBox
    return Scaffold(
      appBar: AppBar(
        title: TextHeading(title: widget.title),
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(child: _generateWidgets()),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonCircularBorder(
              name: "See results",
              onButtonClick: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _generateWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 14, bottom: 14),
          child: BasicTextStyle(
            name: "Sort by",
            optFontWeight: FontWeight.bold,
            optfontSize: 14,
          ),
        ),
        DropDownSortByButton(
          leftPadding: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BasicTextStyle(
                name: "Hourly rate",
                optFontWeight: FontWeight.bold,
                optfontSize: 14,
              ),
              ClearButton(
                onButtonClick: () {
                  minRateController.clear();
                  maxRateController.clear();
                },
              )
            ],
          ),
        ),
        MinMaxRange(
            minRateController: minRateController,
            maxRateController: maxRateController,
            rangeEndText: "max",
            rangeStartText: "min",
            minHintText: "0",
            maxHintText: "80+",
            minLength: 3,
            prefixIconPath: "assets/icons/currency/dollar.png",
            height: 40,
            width: 145,
            onChangeFocus: (isMinimum) {
              if (isMinimum &&
                  minRateController.text.isNotEmpty &&
                  maxRateController.text.isNotEmpty) {
                var minValue = int.parse(minRateController.text);
                var maxValue = int.parse(maxRateController.text);

                if (minValue > maxValue) {
                  minRateController.clear();
                }
              }
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BasicTextStyle(
                name: "Skills",
                optFontWeight: FontWeight.bold,
                optfontSize: 14,
              ),
              ClearButton(
                onButtonClick: () {
                  for (var key in checkBoxKeys) {
                    key.currentState?.setState(() {
                      key.currentState?.unCheck();
                    });
                  }
                },
              )
            ],
          ),
        ),
        for (Widget checkbox in getCheckboxlist()) checkbox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BasicTextStyle(
                name: "Rating",
                optFontWeight: FontWeight.bold,
                optfontSize: 14,
              ),
              ClearButton(
                onButtonClick: () {
                  for (var key in ratingKeys) {
                    key.currentState?.removeStar();
                    key.currentState?.disableButton();
                  }
                  ratingKeys.elementAt(0).currentState?.enableButton();
                  eventBus.fire(RatingChangeEvent(rating: ""));
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: _getRating(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BasicTextStyle(
                name: "Reviews",
                optFontWeight: FontWeight.bold,
                optfontSize: 14,
              ),
              ClearButton(
                onButtonClick: () {
                  minReviewController.clear();
                  minReviewController.clear();
                },
              )
            ],
          ),
        ),
        MinMaxRange(
          minRateController: minReviewController,
          maxRateController: maxReviewController,
          rangeEndText: "max",
          rangeStartText: "min",
          minHintText: "0",
          maxHintText: "500+",
          height: 40,
          width: 145,
          onChangeFocus: (isMinimum) {
            if (isMinimum &&
                minReviewController.text.isNotEmpty &&
                maxReviewController.text.isNotEmpty) {
              var minValue = int.parse(minReviewController.text);
              var maxValue = int.parse(maxReviewController.text);

              if (minValue > maxValue) {
                minReviewController.clear();
              }
            }
          },
        ),
      ],
    );
  }

  List<Widget> getCheckboxlist() {
    List<Widget> checkboxes = List.empty(growable: true);
    for (var category in UserCategory.values) {
      if (!category.name.toLowerCase().startsWith("none")) {
        GlobalKey<CustomCheckBoxTileState> _key =
            GlobalKey<CustomCheckBoxTileState>();
        checkBoxKeys.add(_key);
        if (widget.filterInfo.skills.contains(category)) {
          checkboxes.add(CustomCheckBoxTile(
            key: _key,
            categoryName: category.name,
            isChecked: true,
          ));
        } else {
          checkboxes.add(CustomCheckBoxTile(
            key: _key,
            categoryName: category.name,
          ));
        }
      }
    }

    return checkboxes;
  }

  List<Widget> _getRating() {
    List<Widget> stars = [];

    for (var count = 0; count < 5; count++) {
      GlobalKey<RatingState> _key = GlobalKey<RatingState>();
      ratingKeys.add(_key);
      var star = Rating(
        key: _key,
        height: 20,
        rating: count + 1,
        isActive: count >= widget.filterInfo.rating ? false : true,
        disableButton: (count < widget.filterInfo.rating - 1) ? true : false,
        onRatingUpdate: (isActive, currentRating) {
          if (isActive) {
            if (currentRating > 0) {
              ratingKeys
                  .elementAt(currentRating - 1)
                  .currentState
                  ?.disableButton();
            }
            if (currentRating + 1 < ratingKeys.length) {
              ratingKeys
                  .elementAt(currentRating + 1)
                  .currentState
                  ?.enableButton();
            }
            currentRating += 1;
          } else {
            if (currentRating > 0) {
              ratingKeys
                  .elementAt(currentRating - 1)
                  .currentState
                  ?.enableButton();
            }
            if (currentRating + 1 < ratingKeys.length) {
              ratingKeys
                  .elementAt(currentRating + 1)
                  .currentState
                  ?.disableButton();
            }
          }

          if (currentRating > 0) {
            eventBus.fire(RatingChangeEvent(
                rating: currentRating == 5
                    ? "  $currentRating stars"
                    : "  $currentRating or up"));
          } else {
            eventBus.fire(RatingChangeEvent(rating: ""));
          }
        },
      );
      stars.add(star);
    }

    if (widget.filterInfo.rating > 0) {
      stars.add(DynamicText(
        eventBus: eventBus,
        text: widget.filterInfo.rating == 5
            ? "  ${widget.filterInfo.rating} stars"
            : "  ${widget.filterInfo.rating} or up",
      ));
    } else {
      stars.add(DynamicText(
        eventBus: eventBus,
        text: "",
      ));
    }

    return stars;
  }
}
