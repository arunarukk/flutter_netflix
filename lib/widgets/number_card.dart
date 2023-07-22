import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final int index;
  List<dynamic> item = [];
  
   NumberCard({Key? key, required this.item, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              height: 180,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:  DecorationImage(
                  image: NetworkImage(
              'https://image.tmdb.org/t/p/w500' + item[index]['poster_path']),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 2,
          bottom: -15,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 150,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  letterSpacing: 0.01),
            ),
          ),
        )
      ],
    );
  }
}
