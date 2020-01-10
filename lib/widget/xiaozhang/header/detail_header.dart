import 'package:flutter/material.dart';
import 'package:ibaozi/const/color_const.dart';
import 'package:ibaozi/widget/xiaozhang/header/diagonally_cut_colored_image.dart';
import 'package:ibaozi/data/friend.dart';
import 'package:meta/meta.dart';

class DetailHeader extends StatelessWidget {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';

  DetailHeader(
    this.friend, {
    @required this.avatarTag,
    @required this.onFollowPressed,
  });

  final Friend friend;
  final Object avatarTag;
  final Function onFollowPressed;

  Widget _buildDiagonalImageBackground(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return new DiagonallyCutColoredImage(
      new Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 230.0,
        fit: BoxFit.cover,
      ),
      color: RED_LIGHT,
    );
//    return Container(
//      height: 280,
//      width: screenWidth,
//      decoration: BoxDecoration(
//        gradient: SIGNUP_CARD_BACKGROUND,
//      ),
//    );
  }

  Widget _buildAvatar() {
    return new Hero(
      tag: avatarTag,
      child: new CircleAvatar(
        backgroundImage: new AssetImage(friend.avatar),
        radius: 50.0,
      ),
    );
  }

  Widget _buildFollowerInfo(TextTheme textTheme) {
    var followerStyle =
        textTheme.subhead.copyWith(color: const Color(0xBBFFFFFF));

    return new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('72 关注', style: followerStyle),
          new Text(
            ' | ',
            style: followerStyle.copyWith(
                fontSize: 24.0, fontWeight: FontWeight.normal),
          ),
          new Text('632 粉丝', style: followerStyle),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ThemeData theme) {
    return new Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createPillButton(
            '联系我',
            backgroundColor: theme.bottomAppBarColor,
          ),
          _createPillButton('关注',
              textColor: Colors.black87, backgroundColor: Colors.white),
        ],
      ),
    );
  }

  Widget _createPillButton(
    String text, {
    Color backgroundColor = Colors.transparent,
    Color textColor = Colors.black54,
  }) {
    return new ClipRRect(
      borderRadius: new BorderRadius.circular(30.0),
      child: new MaterialButton(
        minWidth: 140.0,
        color: backgroundColor,
        textColor: textColor,
        onPressed: () {
          onFollowPressed(text);
        },
        child: new Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return new Stack(
      children: <Widget>[
        _buildDiagonalImageBackground(context),
        new Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.2,
          child: new Column(
            children: <Widget>[
              _buildAvatar(),
              _buildFollowerInfo(textTheme),
              _buildActionButtons(theme),
            ],
          ),
        ),
//        new Positioned(
//          top: 26.0,
//          left: 4.0,
//          child: new BackButton(color: Colors.white),
//        ),
      ],
    );
  }
}
