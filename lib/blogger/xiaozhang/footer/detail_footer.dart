import 'package:flutter/material.dart';
import 'package:ibaozi/blogger/xiaozhang/footer/articles_showcase.dart';
import 'package:ibaozi/blogger/xiaozhang/footer/portfolio_showcase.dart';
import 'package:ibaozi/blogger/xiaozhang/footer/skills_showcase.dart';
import '../../../data/friend.dart';

class FriendShowcase extends StatefulWidget {
  FriendShowcase(this.friend);

  final Friend friend;

  @override
  _FriendShowcaseState createState() => new _FriendShowcaseState();
}

class _FriendShowcaseState extends State<FriendShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(text: '技能'),
      new Tab(text: '博客'),
      new Tab(text: '经历'),
    ];
    _pages = [
      new PortfolioShowcase(),
      new SkillsShowcase(),
      new ArticlesShowcase(),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(280.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
