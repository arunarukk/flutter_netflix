import 'package:flutter/cupertino.dart';
import 'package:netflix_tmdb/data/data_controller.dart';

import 'main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top 10 in india Today'),
        LimitedBox(
            maxHeight: 200,
            child: ValueListenableBuilder(
                valueListenable: ContentController.instance.topMoviesNotifier,
                builder: (BuildContext ctx, List<dynamic> item, Widget? _) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      10,
                      (index) => NumberCard(
                        index: index,
                        item: item,
                      ),
                    ),
                  );
                })),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
