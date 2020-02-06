import 'package:flutter/material.dart';
import 'package:ibaozi/blog/top_title.dart';
import 'package:ibaozi/const/color_const.dart';

class BlogHomePage extends StatelessWidget {
  BlogHomePage(this.onMenuPressed);

  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [YELLOW, GREEN, BLUE],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2.0, 1.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          TopTitleBar(onMenuPressed: onMenuPressed,),
        ],
      ),
    );
  }
}
