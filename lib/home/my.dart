import 'package:flutter/material.dart';

class My extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyState('我的');
  }
}

class _MyState extends State<My>{

  final String content;

  _MyState(this.content);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.content),
    );
  }

}