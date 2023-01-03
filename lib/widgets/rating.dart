import 'package:artist_gallore/models/constants.dart';
import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final double height;
  final int rating;
  final bool isActive;
  final bool disableButton;
  final Function(bool, int) onRatingUpdate;

  const Rating(
      {Key? key,
      required this.height,
      required this.rating,
      required this.isActive,
      required this.disableButton,
      required this.onRatingUpdate})
      : super(key: key);

  @override
  State<Rating> createState() => RatingState();
}

class RatingState extends State<Rating> {
  late bool _isActive;
  late Image _imageToShow;
  late bool _absorbEvent;
  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
    _absorbEvent = widget.disableButton;
    _updateRating(widget.isActive);
  }

  void disableButton() {
    setState(() {
      _absorbEvent = true;
    });
  }

  void enableButton() {
    setState(() {
      _absorbEvent = false;
    });
  }

  void removeStar() {
    setState(() {
      _isActive = false;
      _updateRating(_isActive);
    });
  }

  void _updateRating(bool isActive) {
    if (isActive) {
      _imageToShow = Image.asset(
        IconsContants.ratingSelect,
        height: widget.height,
      );
    } else {
      _imageToShow = Image.asset(
        IconsContants.ratingUnSelect,
        height: widget.height,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: _absorbEvent,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (widget.rating >= 1) {
              _isActive = !_isActive;
              _updateRating(_isActive);
              widget.onRatingUpdate(_isActive, widget.rating - 1);
            }
          });
        },
        child: _imageToShow,
      ),
    );
  }
}
