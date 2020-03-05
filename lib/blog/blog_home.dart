import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibaozi/view/tab/pointTabIndicator.dart';

class BlogHome extends StatefulWidget {
  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome>
    with SingleTickerProviderStateMixin {
  final tabList = ['热门', '最新', 'Android', 'Flutter'];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('IBAOZI.CN'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          bottom: TabBar(
            controller: _tabController,
            indicator: PointTabIndicator(
              position: PointTabIndicatorPosition.bottom,
              color: Colors.white,
              insets: EdgeInsets.only(bottom: 6),
            ),
            tabs: tabList.map((item) {
              return Tab(
                text: item,
              );
            }).toList(),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: TabBarView(
            controller: _tabController,
            children: tabList.map((item) {
              return Center(child: Text(item));
            }).toList(),
          ),
        ));
  }
}
