import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibaozi/const/gradient_const.dart';
import 'package:ibaozi/blogger/xiaozhang/footer/detail_footer.dart';
import 'package:ibaozi/blogger/xiaozhang/xiaozhang_detail_body.dart';
import 'package:ibaozi/blogger/xiaozhang/header/detail_header.dart';
import 'package:meta/meta.dart';
import '../../data/friend.dart';
import 'package:url_launcher/url_launcher.dart';

import 'footer/articles_showcase.dart';
import 'footer/portfolio_showcase.dart';
import 'footer/skills_showcase.dart';

class XiaoZhangDetailsPage extends StatefulWidget {
  XiaoZhangDetailsPage(
    this.friend, {
    @required this.avatarTag,
  });

  final Friend friend;
  final Object avatarTag;

  @override
  _XiaoZhangDetailsPageState createState() => new _XiaoZhangDetailsPageState();
}

class _XiaoZhangDetailsPageState extends State<XiaoZhangDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: double.infinity,
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new DetailHeader(
              widget.friend,
              avatarTag: widget.avatarTag,
              onFollowPressed: (text) {
                if (text == "联系我") {
                  launch("mailto:zzy0523@gmail.com").catchError((error) {
                    Clipboard.setData(ClipboardData(text: 'zzy0523@gmail.com'));
                    showBottomSheet(
                        context: this.context,
                        builder: (_) => Container(
                              padding: EdgeInsets.all(10),
                              child: Text("已将📮zzy0523@gmail.com复制到剪切板📋"),
                            ));
                  });
                } else {
                  launch("https://www.jianshu.com/u/77699cd41b28");
                }
              },
            ),
            new Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: new DetailBody(widget.friend),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Column(
                children: <Widget>[
                  new ArticlesShowcase(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
