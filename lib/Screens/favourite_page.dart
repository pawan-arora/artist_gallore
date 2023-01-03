import 'package:artist_gallore/Services/users_DB_service.dart';
import 'package:artist_gallore/models/user_profile.dart';
import 'package:artist_gallore/styles/text_heading.dart';
import 'package:artist_gallore/widgets/circular_progress_bar.dart';
import 'package:artist_gallore/widgets/cards/user_profile_card_list.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  final String title;
  const FavouritePage({Key? key, required this.title}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<UserProfile> favourites = List.empty();
  late Future<List<UserProfile>> fetchFavorites;

  @override
  void initState() {
    super.initState();
    fetchFavorites = UsersDBService.fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextHeading(title: widget.title),
      ),
      body: _generateFavouriteList(),
    );
  }

  Widget _generateFavouriteList() {
    return FutureBuilder<List<UserProfile>>(
      future: fetchFavorites,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CustomCircularProgressBar();
        }

        List<UserProfile> favouriteUsers = snapshot.data ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return UserProfileCardList(
              foregroundColor: Colors.white,
              userProfile: favouriteUsers[index],
              imageHeight: 80,
              imageWidth: 160,
              onFavouriteButtonClick: (() {
                setState(() {
                  fetchFavorites = UsersDBService.fetchFavorites();
                });
              }),
            );
          },
          itemCount: favouriteUsers.length,
        );
      },
    );
  }
}
