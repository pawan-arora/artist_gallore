import 'package:artist_gallore/widgets/custom_floating_search.dart';
import 'package:artist_gallore/widgets/location_select_bar_bottom.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          showFloatingSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
        child: Container(
            height: 43,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 202, 195, 202),
              borderRadius: BorderRadius.circular(35),
              //border: Border.all(color: Colors.black),
            )),
      ),
      Positioned(
        left: 40,
        bottom: 12,
        child: GestureDetector(
          onTap: () {
            showFloatingSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          child: const Text(
            "Search Any Artist",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      Transform.scale(
        scale: .7,
        child: IconButton(
          icon: Image.asset(
            "assets/images/search_icon.png",
            color: Colors.grey,
          ),
          onPressed: () {
            showFloatingSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
        ),
      ),
    ]);
  }
}

class CustomSearchDelegate extends SearchFloatingDelegate {
  final List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
  ];

  @override
  Widget buildActions(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        query = "";
      },
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget? buildBottom(BuildContext context) {
    return const LocationSelect();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var lang in _searchHistory) {
      if (lang.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(lang);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var lang in _searchHistory) {
      if (lang.toLowerCase().trim().startsWith(query.toLowerCase(), 0)) {
        matchQuery.add(lang);
      }
    }

    return _getWidget(matchQuery);
  }

  Widget _getWidget(List<String> matchQuery) {
    if (query.isEmpty) {
      matchQuery = [];
      for (var lang in _searchHistory) {
        matchQuery.add(lang);
      }

      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: const Text(
                "RECENT SEARCHES",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: matchQuery.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                String result = matchQuery[index];
                return ListTile(
                  title: Text(result),
                  leading: const Icon(Icons.search),
                );
              },
            ),
            const Divider(
              thickness: 2,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: const Text(
                "POPULAR CATEGORIES",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: matchQuery.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                String result = matchQuery[index];
                return ListTile(
                  title: Text(result),
                  leading: const Icon(Icons.search),
                );
              },
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          String result = matchQuery[index];
          return ListTile(
            title: Text(result),
            leading: const Icon(Icons.search),
          );
        },
      );
    }
  }
}
