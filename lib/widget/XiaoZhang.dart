import 'package:flutter/material.dart';
import 'package:ibaozi/const/gradient_const.dart';

class XiaoZhang extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XiaoZhangState('我的');
  }
}

class _XiaoZhangState extends State<XiaoZhang> {
  final String content;

  _XiaoZhangState(this.content);

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
                  children: <Widget>[Text('XiaoZhang')],
                ))));
  }
}
