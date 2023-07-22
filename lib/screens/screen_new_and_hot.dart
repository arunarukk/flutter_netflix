import 'package:flutter/material.dart';
import 'package:netflix_tmdb/data/data_controller.dart';
import 'package:netflix_tmdb/screens/screen_home.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/number_title_card.dart';

class ScreenNewAndHot extends StatefulWidget {
  ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  final comingListkey = GlobalKey();

  final everyListkey = GlobalKey();

  final ScrollController comingScroll = ScrollController();

  final ScrollController everyScroll = ScrollController();

  bool comingClicked = true;
  bool everyClicked = false;

  @override
  Widget build(BuildContext context) {
    ContentController.instance.getUpComming();

    return Scaffold(
        appBar: PreferredSize(
            child: AppBarWidget(
              title: 'New & Hot',
              icon: Icons.notifications,
            ),
            preferredSize: Size.fromHeight(50)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          comingClicked = true;
                          everyClicked = false;
                        });
                        // print('--com-----------${everyListkey.currentContext}');
                        Scrollable.ensureVisible(comingListkey.currentContext!,
                            duration: Duration(seconds: 2), alignment: -0.01);
                        //child:
                        //new Text("Scroll to data");
                        // comingScroll.animateTo(
                        //     comingScroll.position.maxScrollExtent,
                        //     duration: Duration(milliseconds: 500),
                        //     curve: Curves.fastOutSlowIn);
                        // final _position = comingScroll.position.maxScrollExtent;
                        // comingScroll.animateTo(_position,
                        //     curve: Curves.linear,
                        //     duration: Duration(milliseconds: 500));
                      },
                      child: Container(
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: comingClicked == true
                                ? Colors.white
                                : Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.movie,
                              color: comingClicked == true
                                  ? Colors.black
                                  : Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Coming Soon",
                              style: TextStyle(
                                  color: comingClicked == true
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          everyClicked = true;
                          comingClicked = false;
                        });
                        Scrollable.ensureVisible(everyListkey.currentContext!,
                            duration: Duration(seconds: 2), alignment: -0.01);

                        // print(
                        //     '-------------------${everyListkey.currentState}');
                      },
                      child: Container(
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: everyClicked == true
                                ? Colors.white
                                : Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fireplace,
                              color: everyClicked == true
                                  ? Colors.black
                                  : Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Everyone's Watching",
                              style: TextStyle(
                                  color: everyClicked == true
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          // color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.ten_k_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Top 10",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.movie,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Coming Soon",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable:
                            ContentController.instance.upcomingNotifier,
                        builder:
                            (BuildContext ctx, List<dynamic> item, Widget? _) {
                          //print(item);
                          // print(
                          //     '---------widget--com--------${everyListkey.currentState}');

                          return ListView(
                            key: comingListkey,
                            controller: comingScroll,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: List.generate(
                                10,
                                (index) => ComingSoonWidget(
                                      item: item,
                                      index: index,
                                    )),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.fireplace,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Everyone's Watching",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable:
                            ContentController.instance.popularNotifier,
                        builder:
                            (BuildContext ctx, List<dynamic> item, Widget? _) {
                          // print(item);
                          // print(
                          //     '---------wid--ever--------${everyListkey.currentState}');
                          //print(everyListkey.);

                          return ListView(
                            controller: everyScroll,
                            key: everyListkey,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: List.generate(
                                10,
                                (index) => EveryOnesWidget(
                                      item: item,
                                      index: index,
                                    )),
                          );
                        }),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class ComingSoonWidget extends StatelessWidget {
  final int index;
  final List<dynamic> item;
  ComingSoonWidget({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  Widget DateWidget = Container();

  @override
  Widget build(BuildContext context) {
    String? date = item[index]["release_date"];
    // print("212 ${date}");

    if (date != null) {
      final day = date[8] + date[9];
      final month = date[5] + date[6];

      DateWidget = getDate(day, month);
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateWidget,
              // Text(
              //   '${index + 1}',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 30,
              //     decoration: TextDecoration.none,
              //     color: Colors.white,
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.blue
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  item[index]["backdrop_path"]),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    width: 300,
                    //color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(item[index]['original_title'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          NewButtonWidget(
                              title: 'Remind Me',
                              icon: Icons.notifications_none),

                          NewButtonWidget(
                              title: 'Info', icon: Icons.info_outline),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    //height: 100,
                    width: 300,
                    //color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item[index]['release_date'],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item[index]['overview'],
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Text(item[index]['release_date'],
                        //     style: TextStyle(
                        //         fontSize: 14, fontWeight: FontWeight.bold))
                        Row(
                          children: [
                            for (var element in item[index]['genre_ids'])
                              Text(
                                "${Genres().listOfGenres[element]}  ",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getMonthName(String month) {
    String month2;
    switch (month) {
      case "01":
        month2 = "Jan";
        break;
      case "02":
        month2 = "Feb";
        break;
      case "03":
        month2 = "Mar";
        break;
      case "04":
        month2 = "Apr";
        break;
      case "05":
        month2 = "May";
        break;
      case "06":
        month2 = "Jun";
        break;
      case "07":
        month2 = "Jul";
        break;
      case "08":
        month2 = "Aug";
        break;
      case "09":
        month2 = "Sep";
        break;
      case "10":
        month2 = "Oct";
        break;
      case "11":
        month2 = "Nov";
        break;
      case "12":
        month2 = "Dec";
        break;
      default:
        month2 = "January";
    }
    return month2;
  }

  Widget getDate(String day, String month) {
    String monthName = getMonthName(month);
    return Container(
      child: Column(
        children: [
          Text(
            monthName,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            day,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class EveryOnesWidget extends StatelessWidget {
  final int index;
  final List<dynamic> item;
  const EveryOnesWidget({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   '${index + 1}',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 30,
              //     decoration: TextDecoration.none,
              //     color: Colors.white,
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.blue
                      image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                            item[index][index]["backdrop_path"]),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    //color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            child: Text(item[index][index]['original_title'],
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          NewButtonWidget(title: 'Share', icon: Icons.share),
                          NewButtonWidget(title: 'My List', icon: Icons.add),
                          NewButtonWidget(
                              title: 'Play', icon: Icons.play_arrow),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    //height: 100,
                    width: 350,
                    //color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item[index][index]['overview'],
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            for (var element in item[index][index]['genre_ids'])
                              Text(
                                "${Genres().listOfGenres[element]}  ",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const NewButtonWidget({
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
          size: 20,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    );
  }
}

class Genres {
  Map<int, String> listOfGenres = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animatiomn',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Science Fiction',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western'
  };
}
