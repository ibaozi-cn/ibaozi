import 'package:flutter/material.dart';
import 'package:ibaozi/const/gradient_const.dart';

class My extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyState('作者');
  }
}

class _MyState extends State<My> {
  final String content;

  _MyState(this.content);

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
                  children: <Widget>[Text('ccc'), Text('ddd')],
                ))));
  }
}
