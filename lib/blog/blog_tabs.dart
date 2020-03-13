import 'package:flutter/material.dart';
import 'package:ibaozi/about/text_styles.dart';
import 'package:ibaozi/blog/blog_tab_item.dart';
import 'package:ibaozi/data/blog_model.dart';

class BlogTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BlogTabsState();
  }
}

class _BlogTabsState extends State<BlogTabs> {
  var _selectIndex = 0;

  List<Blog> _blogListData = [];

  var _blogListFlutter = [
    Blog(
        title: "Flutter环境搭建",
        content: Content(
          subtitle:
              "Flutter 1.0 正式版发布，Flutter 是 Google 用以帮助开发者在 iOS 和 Android 两个平台开发高质量原生 UI 的移动 SDK。官方还创建了Flutter中文社区，从未见过如此用心，相信在不久的将来，一定有它的用武之地，来跟我一起研究，一起探讨，走起。",
        ),
        importedUrl: "images/01.jpg",
        mediumUrl: "https://www.jianshu.com/p/ab2bbcdc54d0"),
    Blog(
        title: "为什么学习以及如何学习Flutter",
        content: Content(
            subtitle:
                "在这篇文章中，我将谈谈为什么开始学习Flutter和Dart语言。我是如何做到这一点的，以及我保持专注的策略是什么。希望能帮助您开始使用Google的移动开发框架并继续您的旅程。"),
        importedUrl: "images/02.jpg",
        mediumUrl: "https://www.jianshu.com/p/0514ab661c96")
  ];

  var _blogListAndroid = [
    Blog(
        title: "Android一次完美的跨进程服务共享实践",
        content: Content(
            subtitle: "最近需要做这样一个事情，一个服务来完成多款App的录音功能，大致有如下逻辑" +
                "\n* 服务以lib的形式集成到各个端" +
                "\n* 当主App存在时，所有其他App都使用主App的录音服务" +
                "\n* 当主App不存在时，其他App使用自带录音服务" +
                "\n* 有优先级，优先级高的App有绝对的录音权限，不管其他App是否在录音都要暂停，优先处理高优先级的App请求" +
                "\n* 支持AudioRecord、MediaRecorder两种录音方案"),
        importedUrl: "images/android_audio_ac.png",
        mediumUrl: "https://www.jianshu.com/p/662f1b042529"),
    Blog(
        title: "看Android的发展历程-谈一下当下最合适的架构",
        content: Content(
            subtitle:
                "上次我们讲到一个好的架构有哪些优点，当然好的架构肯定还有其他方面的优势，我只是表达了自己的一些观点，有问题欢迎反驳，我们一起讨论。下面我们来看看当前版本的Android架构，如何做到最合适，也不一定是最合适，但大方向肯定要正确。我们先看看架构的历程。"),
        importedUrl: "images/android_ac.png",
        mediumUrl: "https://www.jianshu.com/p/d90dbed80a38")
  ];

  var _blogListTest = [
    Blog(
        title: "待补",
        content: Content(
            subtitle:
            "待补"),
        importedUrl: "images/portfolio_4.png",
        mediumUrl: "https://www.jianshu.com/p/d90dbed80a38")
  ];

  _getBlogList(int index) {
    switch (index) {
      case 0:
        return _blogListFlutter;
        break;
      case 1:
        return _blogListAndroid;
        break;
      case 2:
        return _blogListTest;
        break;
      case 3:
        return _blogListTest;
        break;
      case 4:
        return _blogListTest;
        break;
      case 5:
        return _blogListTest;
        break;
      case 6:
        return _blogListTest;
        break;
    }
  }

  var _selectDataList = [
    "Flutter",
    "Android",
    "JS",
    "Python",
    "JVM",
    "Spring",
    "Linux"
  ];

  _getRowListItem(bool isSelected, int index) {
    return Row(
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            setState(() {
              _selectIndex = index;
              _blogListData = _getBlogList(index);
            });
          },
          color: isSelected ? Colors.amber : Colors.white,
          child: Text(
            _selectDataList[index],
            style: TextStyles.menu_item
                .copyWith(color: isSelected ? Colors.white : Color(0xFF50AFC0)),
          ),
        ),
        SizedBox(width: 5)
      ],
    );
  }

  @override
  void initState() {
    _blogListData.addAll(_blogListFlutter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 45,
            child: ListView.builder(
              itemCount: _selectDataList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _getRowListItem(_selectIndex == index, index);
              },
            ),
          ),
          Expanded(
            child: BlogTabItem(
              blogs: _blogListData,
            ),
          )
        ],
      ),
    );
  }
}
