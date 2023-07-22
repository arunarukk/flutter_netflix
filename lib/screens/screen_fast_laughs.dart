import 'package:flutter/material.dart';
import 'package:netflix_tmdb/data/data_controller.dart';
import 'package:netflix_tmdb/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: ContentController.instance.popularNotifier,
            builder: ((BuildContext ctx, List<dynamic> item, Widget? _) {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  10,
                  (index) {
                    return VideoListItem(
                      item: item,
                      index: index,
                    );
                  },
                ),
              );
            })),
      ),
    );
  }
}
