import 'package:flutter/material.dart';
import 'package:ibaozi/blog/blog_detai.dart';
import 'package:ibaozi/blog/blog_lists.dart';
import 'package:ibaozi/signup/Login.dart';
import 'package:ibaozi/util/SizeUtil.dart';

import 'home.dart';
import 'my.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    BlogLists(),
    Login()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeUtil.size = MediaQuery.of(context).size;
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('博主')),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), title: Text('博客')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
      ),
    );
  }
}
