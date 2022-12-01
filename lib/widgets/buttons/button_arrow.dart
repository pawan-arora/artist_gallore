import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonArrow extends StatelessWidget {
  final String direction;
  final IconData? iconData;
  final String? displayText;
  final String alternativeText = "view all";
  final Function() onArrowButtonClick;

  const ButtonArrow(
      {Key? key,
      required this.direction,
      this.iconData,
      this.displayText,
      required this.onArrowButtonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getWidget(),
        IconButton(
          onPressed: () {
            onArrowButtonClick();
          },
          icon: SvgPicture.asset(direction),
          constraints: const BoxConstraints(),
        )
      ],
    );
  }

  Widget _getWidget() {
    if (iconData == null) {
      return InkWell(
        onTap: () {
          onArrowButtonClick();
        },
        child: Text(
          displayText ?? alternativeText,
          style: const TextStyle(
              color: Colors.cyan,
              decoration: TextDecoration.underline,
              fontSize: 20),
        ),
      );
    } else {
      return IconButton(
        padding: const EdgeInsetsDirectional.only(start: 10),
        constraints: const BoxConstraints(),
        onPressed: () {
          onArrowButtonClick();
        },
        icon: Icon(iconData),
      );
    }
  }
}
