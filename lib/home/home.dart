import 'package:flutter/material.dart';
import 'package:ibaozi/const/color_const.dart';
import 'package:ibaozi/const/gradient_const.dart';
import 'package:ibaozi/widget/Default.dart';
import 'package:ibaozi/widget/Mage.dart';
import 'package:ibaozi/data/friend.dart';
import 'package:ibaozi/widget/xiaozhang/xiaozhang_details_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState("主页");
  }
}

class _HomeState extends State<Home> {
  String content;
  List<Widget> widgets = new List<Widget>();
  PageController _transController = new PageController();
  var _currentPageValue = 0.0;
  var _havePages = 0;

  _HomeState(this.content);

  @override
  void initState() {
    super.initState();
    widgets.add(Mage());
    widgets.add(XiaoZhangDetailsPage(
        Friend(
            avatar: "images/avatar_xiaozhang.jpg",
            name: "i校长",
            location: "北京",
            email: "zzy0523@gmail.com"),
        avatarTag: 0));
    widgets.add(Default());
    setState(() {
      _havePages = widgets.length - 1;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _transController.addListener(() {
      setState(() {
        _currentPageValue = _transController.page;
      });
    });
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: SIGNUP_BACKGROUND,
          ),
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: _itemBuilder,
            itemCount: widgets.length,
            onPageChanged: _onPageChanged,
            controller: _transController,
            physics: BouncingScrollPhysics(),
          )),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: TRANSPARENT_BACKGROUND,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                _transController.jumpToPage((_currentPageValue + 1).toInt());
                setState(() {
                  _havePages = (widgets.length - _currentPageValue - 1).toInt();
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_downward),
                  Text(_havePages.toString())
                ],
              ),
              backgroundColor: BLUE,
            )
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int value) {
    setState(() {
      _havePages = (widgets.length - value - 1).toInt();
    });
  }

  Widget _itemBuilder(BuildContext context, int position) {
    if (position == _currentPageValue.floor()) {
      return Transform(
        transform: Matrix4.identity()..rotateX(_currentPageValue - position),
        child: Container(
          child: Center(
            child: _getPageByIndex(position),
          ),
        ),
      );
    } else if (position == _currentPageValue.floor() + 1) {
      return Transform(
        transform: Matrix4.identity()..rotateX(_currentPageValue - position),
        child: Container(
          child: Center(
            child: _getPageByIndex(position),
          ),
        ),
      );
    } else {
      return Container(
        child: Center(
          child: _getPageByIndex(position),
        ),
      );
    }
  }

  Widget _getPageByIndex(int index) {
    return widgets[index];
  }
}
