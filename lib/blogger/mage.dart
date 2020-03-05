import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ibaozi/const/color_const.dart';
import 'package:ibaozi/const/gradient_const.dart';
import 'package:ibaozi/util/size_util.dart';
import 'package:ibaozi/blogger/custom/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom/profile_const.dart';

class Mage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MageState('我的');
  }
}

class _MageState extends State<Mage> {
  final String content;

  _MageState(this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 100,
                    top: 10,
                    right: 15,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _itemPhoto("images/avatar.jpg"),
                      _itemFlow(),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Marco',
                      style: TextStyle(
                        color: TEXT_BLACK,
                        fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_XXL),
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Thinking in Android',
                      style: TextStyle(
                        color: TEXT_BLACK,
                        fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_M),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Android System Develop Engineer',
                      style: TextStyle(
                        color: TEXT_BLACK,
                        fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_M),
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                _buildTags(tags),
                _buildTags(tags2),
                _buildTags(tags3),
                Container(
                  padding: EdgeInsets.only(
                      left: 100, top: 20, right: 15, bottom: 20),
                  child: Text(
                    'If you wish to succeed, you should use persistence as your good friend, experience as your reference, prudence as your brother and hope as your sentry.',
                    softWrap: true,
                    style: TextStyle(
                        color: TEXT_BLACK,
                        fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_S),
                        height: 1.5),
                  ),
                ),
                _bottomBar()
              ],
            )));
  }

  Widget _bottomBar() {
    return Container(
      constraints:
          BoxConstraints.expand(height: SizeUtil.getAxisY(BOTTOM_BAR_HEIGHT)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: SizeUtil.getAxisX(PHOTO_BUTTON_HEIGHT_BG),
            height: SizeUtil.getAxisY(PHOTO_BUTTON_HEIGHT_BG),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x44FFFFFF), Color(0x44FFFFFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(
                SizeUtil.getAxisX(22.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '17,589',
                  style: TextStyle(
                    color: TEXT_BLACK,
                    fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_S),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'followers',
                  style: TextStyle(
                    color: ProfileColors.COLOR_DARK,
                    fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_S),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: SizeUtil.getAxisX(PHOTO_BUTTON_HEIGHT_BG),
            height: SizeUtil.getAxisY(PHOTO_BUTTON_HEIGHT_BG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '9,854',
                  style: TextStyle(
                    color: TEXT_BLACK,
                    fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_S),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'following',
                  style: TextStyle(
                    color: ProfileColors.COLOR_DARK,
                    fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_S),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemPhoto(String img) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeUtil.getAxisX(10.0),
        right: SizeUtil.getAxisX(10.0),
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(22.0),
        child: Image.asset(
          img,
          width: SizeUtil.getAxisBoth(120),
          height: SizeUtil.getAxisBoth(120),
        ),
      ),
    );
  }

  Widget _itemFlow() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      width: SizeUtil.getAxisY(REC_BUTTON_WIDTH),
      height: SizeUtil.getAxisY(REC_BUTTON_HEIGHT),
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            ProfileColors.COLOR_BLACK,
            ProfileColors.COLOR_GREY,
          ],
        ),
        borderRadius: new BorderRadius.circular(100.0),
      ),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(100.0),
        ),
        child: InkWell(
          onTap: () => {launch("https://superandroid.pro/")},
          splashColor: ProfileColors.COLOR_GREY,
          highlightColor: ProfileColors.COLOR_GREY,
          borderRadius: new BorderRadius.circular(100.0),
          child: new Center(
            child: new Text(
              ProfileStrings.STRING_FOLLOW,
              style: new TextStyle(
                fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_S),
                color: ProfileColors.COLOR_YELLOW,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTags(List<String> tags) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        top: 20,
        right: 10,
        bottom: 0,
      ),
      constraints:
          BoxConstraints.expand(height: SizeUtil.getAxisY(PHOTO_BUTTON_HEIGHT)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, idx) {
          return _itemText(tags[idx]);
        },
      ),
    );
  }

  Widget _itemText(String txt) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeUtil.getAxisX(10.0),
        right: SizeUtil.getAxisX(10.0),
      ),
      padding: EdgeInsets.only(
        left: SizeUtil.getAxisX(20.0),
        right: SizeUtil.getAxisX(20.0),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          tagsColors[Random.secure().nextInt(11)],
          tagsColors[Random.secure().nextInt(11)]
        ]),
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              txt,
              style: TextStyle(
                color: ProfileColors.COLOR_WHITE,
                fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_S),
              ),
            ),
//            Text(
//              ProfileStrings.STRING_PHOTOS,
//              style: TextStyle(
//                color: ProfileColors.COLOR_WHITE,
//                fontSize: SizeUtil.getAxisBoth(TEXT_SIZE_S),
//              ),
//            )
          ],
        ),
      ),
    );
  }
}

const tags = [
  "SystemServer",
  "Startup",
  "Launcher",
  "Zygote",
  "Shutdown",
  "init",
  "Activity",
  "View",
  "ViewGroup",
  "Dispatch",
  "LowMemoryKiller",
  "PackageManagerService",
];

const tags2 = [
  "框架服务",
  "通信机制",
  "性能优化",
  "算法",
  "内存泄漏",
  "工厂设计",
  "数据结构",
  "时间复杂度",
  "构造函数",
  "启动流程",
  "Apk安装",
];

const tags3 = [
  "AIDL",
  "JNI",
  "WatchDog",
  "Process",
  "killProcess",
  "ANR",
  "Service",
  "Create Process",
  "LaunchMode",
  "Lifecycle",
  "PackageManager",
  "Singleton",
  "PackageInstaller",
  "PackageParser",
];
