import 'package:flutter/material.dart';

class LocationSelect extends StatelessWidget {
  const LocationSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 5.0, right: 5, left: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.cyan),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_on),
          ),
          InkWell(
            child: const Text("Ghaziabad"),
            onTap: () {
              /* showFloatingSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              ); */
            },
          )
        ],
      ),
    );
  }
}
