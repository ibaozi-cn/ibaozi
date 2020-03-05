import 'package:flutter/material.dart';
import 'package:ibaozi/about/responsive_widget.dart';
import 'package:ibaozi/blog/blog_widget.dart';
import 'package:ibaozi/data/blog_model.dart';

class BlogTab extends StatefulWidget {
  @override
  _BlogTabState createState() => _BlogTabState();
}

class _BlogTabState extends State<BlogTab> {
  List<Blog> _blogs = [];
  bool _loadingData = true;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    loadBlogs();
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingData)
      return Center(
        child: CircularProgressIndicator(),
      );
    if(_showError){
      return Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Something went wrong',style: Theme.of(context).textTheme.headline,),
            ),
            RaisedButton(
              child: Text('Retry',style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
              elevation: 0.0,
              onPressed:loadBlogs,
            )
          ],
        )
      );
    }
    return ResponsiveWidget(
      largeScreen: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 8,
            child: blogList(),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
      smallScreen: blogList(),
    );
  }

  Widget blogList() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                itemCount: _blogs.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    BlogWidget(_blogs[index], index, _blogs.length)),
            RaisedButton(
              child: Text('More',style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
              elevation: 0.0,
              onPressed: () =>{

              }
            )
          ],
        ),
      ),
    );
  }

  void loadBlogs() async {
    setState(() {
      _loadingData = true;
      _showError = false;
    });
    setState(() {
      _blogs = [
        Blog(
          title: "Flutter环境搭建",
          content: Content(
            subtitle: "Flutter 1.0 正式版发布，Flutter 是 Google 用以帮助开发者在 iOS 和 Android 两个平台开发高质量原生 UI 的移动 SDK。官方还创建了Flutter中文社区，从未见过如此用心，相信在不久的将来，一定有它的用武之地，来跟我一起研究，一起探讨，走起。",
          ),
          importedUrl: "images/01.jpg",
          mediumUrl: "https://www.jianshu.com/p/ab2bbcdc54d0"
        ),
        Blog(
            title: "为什么学习以及如何学习Flutter",
            content: Content(
                subtitle: "在这篇文章中，我将谈谈为什么开始学习Flutter和Dart语言。我是如何做到这一点的，以及我保持专注的策略是什么。希望能帮助您开始使用Google的移动开发框架并继续您的旅程。"
            ),
            importedUrl: "images/02.jpg",
            mediumUrl: "https://www.jianshu.com/p/0514ab661c96"
        )];
      _showError = false;
      _loadingData = false;
    });
  }
}
