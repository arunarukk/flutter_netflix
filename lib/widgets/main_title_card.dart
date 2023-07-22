import 'package:flutter/material.dart';
import 'package:netflix_tmdb/data/data_controller.dart';

import 'main_title.dart';

class TrendingMainTitleCard extends StatelessWidget {
  final String title;
  const TrendingMainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ContentController.instance.getTrending();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 180,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.trendingNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  if (item.isNotEmpty) {
                    // print(item);
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      item[index]['poster_path']),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class TvMainTitleCard extends StatelessWidget {
  final String title;
  const TvMainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContentController.instance.getTvShows();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 180,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.tvNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  //print('----------${item}');
                  if (item.isNotEmpty) {
                    // print(item);
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      item[index]['poster_path']),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class TvShowsMainTitleCard extends StatelessWidget {
  final String title;
  const TvShowsMainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ContentController.instance.getTrending();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 180,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.trendingNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  if (item.isNotEmpty) {
                    // print(item);
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      item[index]['poster_path']),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ThrillerMainTitleCard extends StatefulWidget {
  final String title;
  const ThrillerMainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ThrillerMainTitleCard> createState() => _ThrillerMainTitleCardState();
}

class _ThrillerMainTitleCardState extends State<ThrillerMainTitleCard> {
  final ScrollController _sc = ScrollController();

  @override
  void initState() {
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        // _getMoreData(page);
        ContentController.instance.getPopularMovies();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ContentController.instance.getTrending();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: widget.title),
        LimitedBox(
            maxHeight: 180,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.popularNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  if (item.isNotEmpty) {
                    // print(item);
                    return ListView(
                        controller: _sc,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(item.length + 1, (index) {
                          return index == item.length
                              ? ValueListenableBuilder(
                                  valueListenable:
                                      ContentController.instance.isLoading,
                                  builder: (BuildContext ctnx, bool item,
                                      Widget? _) {
                                    return item
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.amber,
                                            ),
                                          )
                                        : const SizedBox.shrink();
                                  },
                                )
                              : Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 160,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              item[0][index]['poster_path']),
                                    ),
                                  ),
                                );
                        }));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
