import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_tmdb/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final List imageList = [
    'https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.1080.jpg',
    'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg',
    'https://c8.alamy.com/comp/BGMMYM/avatar-year-2009-director-james-cameron-movie-poster-usa-BGMMYM.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarWidget(
            title: 'Downloads',
            icon: Icons.search,
          ),
          preferredSize: Size.fromHeight(50)),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Smart Downloads',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SMART DOWNLOADS',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Downloads for You',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: size.width,
            height: size.width,
            // color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.35,
                  backgroundColor: Colors.grey.shade800,
                ),
                DownloadsImageWidget(
                  imageList: imageList[0],
                  margin: EdgeInsets.only(left: 145),
                  height: 200,
                  angle: 15,
                ),
                DownloadsImageWidget(
                  imageList: imageList[2],
                  margin: EdgeInsets.only(right: 145),
                  height: 200,
                  angle: -15,
                ),
                DownloadsImageWidget(
                  imageList: imageList[1],
                  margin: EdgeInsets.only(top: 5),
                  height: 210,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                color: Colors.grey.shade800,
                onPressed: () {},
                child: Text(
                  'Find More to Download',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.height,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: 150,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                imageList,
              ),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
