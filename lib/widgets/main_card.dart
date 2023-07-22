import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  List<dynamic> item = [];
  int index;
  MainCard({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 160,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500' + item[index]['poster_path']),
        ),
      ),
    );
  }
}
