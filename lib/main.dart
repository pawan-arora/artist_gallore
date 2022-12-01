import 'package:artist_gallore/Screens/favourite_page.dart';
import 'package:artist_gallore/models/constants.dart';
import 'package:artist_gallore/models/gallore_menu_item.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/widgets/buttons/favourite_button.dart';
import 'package:artist_gallore/widgets/custom_navigation_bar.dart';
import 'package:artist_gallore/widgets/floating_search_bar.dart';
import 'package:artist_gallore/widgets/location/location_app_bar.dart';
import 'package:artist_gallore/widgets/menu/menu_list_horizontal_scroll.dart';
import 'package:artist_gallore/styles/text_heading.dart';
import 'package:artist_gallore/widgets/menu/users_profile_list_vertical.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Artist Gallore';
  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(10.0),
            thumbColor: MaterialStateProperty.all(Colors.cyan),
          ),
          textTheme: GoogleFonts.padaukTextTheme(
            Theme.of(context).textTheme,
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  final String title = "Artist Gallore";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          snap: false,
          centerTitle: false,
          title: Padding(
            child: TextHeading(
              title: title,
              fontSize: 16,
            ),
            padding: const EdgeInsets.all(8.0),
          ),
          actions: const [
            LocationAppBar(
              duration: 700,
              pageTransition: PageTransitionType.topToBottom,
            ),
          ],
          bottom: AppBar(
            title: const SearchBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => MenuListHorizontalScroll(items: [
              GalloreMenuItem(
                  name: MenuConstants.paintingName,
                  imagePath: ImageConstants.paintingPath),
              GalloreMenuItem(
                  name: MenuConstants.sculpturegName,
                  imagePath: ImageConstants.sculpturePath),
              GalloreMenuItem(
                  name: MenuConstants.literatureName,
                  imagePath: ImageConstants.literaturePath),
              GalloreMenuItem(
                  name: MenuConstants.musicName,
                  imagePath: ImageConstants.musicPath),
              GalloreMenuItem(
                  name: MenuConstants.performingName,
                  imagePath: ImageConstants.performingPath),
            ], heading: const TextHeading(title: "Categories", fontSize: 20))
                .getGridList(context),
            childCount: 1,
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
            child: TextHeading(title: "Most Popular", fontSize: 20),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 5),
          sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              children: UserProfileListVertical(
                userProfiles: [
                  UserProfile(
                      name: "Chintu",
                      location: "ABC",
                      rating: 4,
                      category: Category.musician,
                      contactNumber: 9871345031,
                      countryName: CountryName.india),
                  UserProfile(
                      name: "Chinta",
                      location: "ABC",
                      category: Category.painter,
                      contactNumber: 9871345031,
                      countryName: CountryName.india),
                  UserProfile(
                      name: "Chintu",
                      location: "ABC",
                      category: Category.painter,
                      contactNumber: 9871345031,
                      countryName: CountryName.india),
                  UserProfile(
                      name: "Chinta",
                      location: "ABC",
                      category: Category.painter,
                      contactNumber: 9871345031,
                      countryName: CountryName.india),
                  UserProfile(
                      name: "Chintu",
                      location: "ABC",
                      category: Category.painter,
                      contactNumber: 9871345031,
                      countryName: CountryName.india),
                  UserProfile(
                      name: "Chinta",
                      location: "ABC",
                      category: Category.painter,
                      contactNumber: 9871345031,
                      countryName: CountryName.india)
                ],
              ).generateGrid(context)),
        ),
      ]),
      bottomNavigationBar: const CustomNaviagationBar(
        themeColor: AppTheme.color,
        pages: [
          MyHomePage(),
          FavouritePage(
            title: "My Favourites",
          )
        ],
      ),
    );
  }
}

class AppTheme {
  static const Color color = Colors.cyan;
}
