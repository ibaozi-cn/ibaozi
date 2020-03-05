import 'package:flutter/material.dart';
import 'package:ibaozi/const/gradient_const.dart';
import 'package:ibaozi/util/size_util.dart';
import 'package:ibaozi/view/delay_animate.dart';
import 'package:ibaozi/blogger/custom/profile_const.dart';

class Launcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  final int delayedAmount = 500;

  _LauncherState();

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
          onTap: () => {
            Navigator.of(context).pushReplacementNamed("/homePage")
          },
          splashColor: ProfileColors.COLOR_GREY,
          highlightColor: ProfileColors.COLOR_GREY,
          borderRadius: new BorderRadius.circular(100.0),
          child: new Center(
            child: new Text(
              "点我加入",
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

  @override
  Widget build(BuildContext context) {
    SizeUtil.size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: SIGNUP_BACKGROUND,
            ),
            child: Column(
              children: <Widget>[
                DelayedAnimation(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: FlutterLogo(
                            size: 60.0,
                          ),
                          radius: 50.0,
                        )),
                  ),
                  delay: delayedAmount,
                ),
                DelayedAnimation(
                  child: Text("欢迎来到我的网站",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: "Icons")),
                  delay: delayedAmount + 1000,
                ),
                DelayedAnimation(
                  child: Text("我是i校长",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 18.0,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                  delay: delayedAmount + 2000,
                ),
                DelayedAnimation(
                  child: Text("至今从事Android开发6年",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20.0,
                          color: Colors.white,
                          fontStyle: FontStyle.normal)),
                  delay: delayedAmount + 3000,
                ),
                DelayedAnimation(
                  child: Text("目前就职于居理新房",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22.0,
                          color: Colors.white,
                          fontStyle: FontStyle.normal)),
                  delay: delayedAmount + 4000,
                ),
                DelayedAnimation(
                  child: Text("为满足人类的一切居住理想而努力",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.0,
                          color: Colors.white,
                          fontStyle: FontStyle.normal)),
                  delay: delayedAmount + 5000,
                ),
                DelayedAnimation(
                  child: Text("我很幸运，也很自豪",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 26.0,
                          color: Colors.white,
                          fontStyle: FontStyle.normal)),
                  delay: delayedAmount + 6000,
                ),
                DelayedAnimation(
                  child: Text("建立这个网站的初心就是学习Flutter",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.0,
                          color: Colors.white,
                          fontStyle: FontStyle.normal)),
                  delay: delayedAmount + 7000,
                ),
                DelayedAnimation(
                  child: Text("来吧你也可以跟我一样，一起学习",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22.0,
                          color: Colors.white,
                          fontStyle: FontStyle.normal)),
                  delay: delayedAmount + 8000,
                ),
                DelayedAnimation(
                  child: Text("一起加油哦。",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20.0,
                          color: Colors.white,
                          fontStyle: FontStyle.normal)),
                  delay: delayedAmount + 9000,
                ),
                DelayedAnimation(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: _itemFlow(),
                  ),
                  delay: delayedAmount + 9000,
                ),
              ],
            )));
  }
}
