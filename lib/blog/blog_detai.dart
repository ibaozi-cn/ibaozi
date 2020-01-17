import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ibaozi/const/gradient_const.dart';
import 'package:ibaozi/const/string_const.dart';
import 'package:ibaozi/widget/custom/top_bar.dart';


class BlogDetail extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BlogDetailState('我的');
  }
}

class _BlogDetailState extends State<BlogDetail> {

  final String content;

  _BlogDetailState(this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: SIGNUP_BACKGROUND,
            ),
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    TopBar(
                      title: "ibaozi.cn",
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: MarkdownBody(data: StringConst.Blog_01),
                    )
                    
                  ],
                )
            )
        ));
  }
}
