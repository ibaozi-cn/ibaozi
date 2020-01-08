import 'package:flutter/material.dart';
import 'package:ibaozi/const/gradient_const.dart';
import 'package:ibaozi/data/server/Api.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState("主页");
  }
}

class _HomeState extends State<Home> {
  String content;

  _HomeState(this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: SIGNUP_BACKGROUND,
            ),
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[Text('aaa'), Text('bbb')],
                ))));
  }
}
