import 'package:artist_gallore/Screens/filter_page.dart';
import 'package:artist_gallore/Services/users_DB_service.dart';
import 'package:artist_gallore/models/filter_info.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/styles/basic_text_style.dart';
import 'package:artist_gallore/styles/multi_style_text.dart';
import 'package:artist_gallore/widgets/buttons/button_circular_border.dart';
import 'package:artist_gallore/widgets/circular_progress_bar.dart';
import 'package:artist_gallore/widgets/location/location_leading_button.dart';
import 'package:artist_gallore/widgets/cards/user_profile_card_list.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  final int duration;
  final String category;

  const UserListPage({Key? key, required this.duration, required this.category})
      : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  bool _isLoading = true;
  List<UserProfile> _usersProfile = List.empty();

  @override
  void initState() {
    super.initState();
    _onLoading();
  }

  void _onLoading() {
    setState(() {
      Future.delayed(Duration(seconds: widget.duration), _loaded);
    });
  }

  Future _loaded() async {
    setState(() {
      _isLoading = false;
      UsersDBService.fetchUsersByCategory(widget.category)
          .then((value) => _usersProfile = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            //expandedHeight: 100,
            toolbarHeight: 120,
            //snap: false,
            centerTitle: false,
            //leadingWidth: 0,
            title: LocationLeadingButton(
              category: widget.category,
              location: "Mount Abu",
            ),
            actions: [
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      //size: 6,
                    ),
                    color: Colors.cyan,
                  ),
                  const BasicTextStyle(
                    name: "Search",
                    optfontSize: 8,
                    textColor: Colors.cyan,
                    optFontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.cyan,
                      ),
                    ),
                    const BasicTextStyle(
                      name: "Map",
                      optfontSize: 8,
                      textColor: Colors.cyan,
                      optFontWeight: FontWeight.bold,
                    ),
                  ]),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.cyan,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 4, left: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MultiStyleText(
                              text: "${_usersProfile.length}",
                              fontWeight: FontWeight.bold,
                              multilines: [
                                TextLine(
                                    text: " results found!",
                                    fontWeight: FontWeight.normal)
                              ]),
                          ButtonCircularBorder(
                            name: "Filter",
                            height: 30,
                            width: 80,
                            onButtonClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FilterPage(
                                    title: "Filters",
                                    filterInfo: FilterInfo(
                                        sortBy: SortBy.mostRelevant,
                                        skills: [
                                          getCategoryConstant(widget.category)
                                        ]),
                                  ),
                                ),
                              );
                            },
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.cyan,
                    height: 1.0,
                  ),
                ],
              ),
            ),
          ),
          getBody()
        ],
      ),
    );
  }

  Widget getBody() {
    if (_isLoading) {
      return _beforeDataLoaded();
    } else {
      return _afterDataLoaded();
    }
  }

  Widget _beforeDataLoaded() {
    return const SliverFillRemaining(
      child: Center(
        child: CustomCircularProgressBar(),
      ),
    );
  }

  UserCategory getCategoryConstant(String category) {
    switch (category.toLowerCase()) {
      case "sculpture":
        return UserCategory.sculpture;
      case "literature":
        return UserCategory.literature;
      case "musician":
        return UserCategory.musician;
      case "painter":
        return UserCategory.painter;
      default:
        return UserCategory.performer;
    }
  }

  Widget _afterDataLoaded() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => UserProfileCardList(
                foregroundColor: Colors.white,
                userProfile: _usersProfile[index],
                imageHeight: 80,
                imageWidth: 160,
              ),
          childCount: _usersProfile.length),
    );
  }
}
