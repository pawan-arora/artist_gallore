import 'package:artist_gallore/models/filter_info.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownSortByButton extends StatefulWidget {
  List<String> sortyByitems = List.empty(growable: true);
  final double leftPadding;

  DropDownSortByButton({Key? key, required this.leftPadding})
      : super(key: key) {
    for (var value in SortBy.values) {
      sortyByitems.add(value.name);
    }
  }

  @override
  State<DropDownSortByButton> createState() => _DropDownSortByButtonState();
}

class _DropDownSortByButtonState extends State<DropDownSortByButton> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.sortyByitems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
        value: dropdownValue,
        focusColor: Colors.transparent,
        hint: Text(dropdownValue),
        buttonDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        icon: const Icon(Icons.arrow_drop_down),
        dropdownWidth: 365,
        buttonHeight: 40,
        buttonWidth: 365,
        buttonPadding: EdgeInsets.only(left: widget.leftPadding),
        isExpanded: true,
        buttonElevation: 2,
        items: widget.sortyByitems
            .map((item) => DropdownMenuItem<String>(
                  //alignment: AlignmentDirectional.,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  value: item,
                ))
            .toList(),
        onChanged: ((value) => setState(() {
              dropdownValue = value!;
            })),
      )),
    );
  }
}
