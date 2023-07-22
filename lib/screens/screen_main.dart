import 'package:flutter/material.dart';
import 'package:netflix_tmdb/screens/screen_downloads.dart';
import 'package:netflix_tmdb/screens/screen_fast_laughs.dart';
import 'package:netflix_tmdb/screens/screen_games.dart';
import 'package:netflix_tmdb/screens/screen_home.dart';
import 'package:netflix_tmdb/screens/screen_new_and_hot.dart';
import 'package:netflix_tmdb/widgets/navigation_bottom.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenGames(),
    ScreenNewAndHot(),
    ScreenFastLaughs(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
