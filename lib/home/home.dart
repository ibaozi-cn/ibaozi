import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeState("主页");
  }
}

class _HomeState extends State<Home>{

  final String content;

  _HomeState(this.content);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.content),
    );
  }

}