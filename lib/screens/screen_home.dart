import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_tmdb/data/data_controller.dart';
import 'package:netflix_tmdb/widgets/background_card.dart';
import 'package:netflix_tmdb/widgets/home_categories_showd.dart';
import 'package:netflix_tmdb/widgets/number_card.dart';

import '../widgets/main_card.dart';
import '../widgets/main_title.dart';
import '../widgets/main_title_card.dart';
import '../widgets/number_title_card.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  @override
  void initState() {
    ContentController.instance.refresh();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // ContentController.instance.refresh();
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: ((BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            //  print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children:  [
                  BackgroundCard(),
                  TvMainTitleCard(
                    title: 'Historical TV Dramas',
                  ),
                  TrendingMainTitleCard(
                    title: 'Trending Now',
                  ),
                  NumberTitleCard(),
                  ThrillerMainTitleCard(
                    title: 'Thriller Movies',
                  ),
                  TvShowsMainTitleCard(
                    title: 'Critically Acclaimed TV Shows',
                  ),
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(microseconds: 3000),
                      width: double.infinity,
                      height: 100,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                'assets/netflix_logo.png',
                                width: 25,
                              ),
                              Spacer(),
                              const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://i.pinimg.com/474x/86/2a/53/862a537a244d4f18264398ebd1a8873a.jpg'),
                                        fit: BoxFit.fitWidth)),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TV Shows',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Movies',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showCatagoriesDialog(context, 'Home');
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Categories',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        );
      }),
    ));
  }
}

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomButtonWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
