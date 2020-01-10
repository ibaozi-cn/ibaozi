import 'package:flutter/material.dart';
import 'package:ibaozi/data/friend.dart';

class DetailBody extends StatelessWidget {
  DetailBody(this.friend);
  final Friend friend;

  Widget _buildLocationInfo(TextTheme textTheme) {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.place,
          color: Colors.black54,
          size: 16.0,
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: new Text(
            friend.location,
            style: textTheme.subhead.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _createCircleBadge(IconData iconData, Color color) {
    return new Padding(
      padding: const EdgeInsets.all(1.0),
      child: new CircleAvatar(
        backgroundColor: color,
        child: new Icon(
          iconData,
          color: Colors.white,
          size: 16.0,
        ),
        radius: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          friend.name,
          style: textTheme.headline.copyWith(color: Colors.black87),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: _buildLocationInfo(textTheme),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: new Text(
            '简书作者，现就职于居理新房，Android资深开发工程师，主要负责公司自研手机Rom迭代以及优化，负责Android端App架构设计等工作。',
            style:
                textTheme.body1.copyWith(color: Colors.black45, fontSize: 14.0),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: new Row(
            children: <Widget>[
              _createCircleBadge(Icons.beach_access, theme.accentColor),
              _createCircleBadge(Icons.cloud, Colors.black54),
              _createCircleBadge(Icons.shop, Colors.amber),
            ],
          ),
        ),
      ],
    );
  }
}
