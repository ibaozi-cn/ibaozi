import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ibaozi/blog/blog_detai.dart';
import 'package:ibaozi/blogger/xiaozhang/xiaozhang_details_page.dart';
import 'package:ibaozi/data/friend.dart';
import 'package:ibaozi/jetpack/index.dart';

import 'blogger/home_blogger.dart';
import 'blogger/mage.dart';
import 'home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return BotToastInit(
        child:MaterialApp(
          title: 'IBaoZi',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.green,
          ),
          navigatorObservers: [BotToastNavigatorObserver()],//2.registered route observer
          home: HomePage(),
          routes: <String, WidgetBuilder>{
            '/blogDetail': (BuildContext context) => BlogDetail(),
            '/homeBlogger': (BuildContext context) => HomeBlogger(),
            '/homePage': (BuildContext context) => HomePage(),
            '/marco': (BuildContext context) => Mage(),
            '/jetpack': (BuildContext context) => JetPackPage(),
            '/xiaozhang': (BuildContext context) => XiaoZhangDetailsPage(Friend(
                avatar: "images/avatar_xiaozhang.jpg",
                name: "i校长",
                location: "北京",
                email: "zzy0523@gmail.com"),
                avatarTag: 0),
          },
        )
    );
  }
}
