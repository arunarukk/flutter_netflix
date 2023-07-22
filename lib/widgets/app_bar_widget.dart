import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Icon(
          icon,
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
    );
  }
}
