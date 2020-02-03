import 'package:flutter/material.dart';
import 'package:ibaozi/blog/top_title.dart';
import 'package:ibaozi/const/color_const.dart';
import 'package:ibaozi/const/shadow_const.dart';
import 'package:ibaozi/blog/feed_const.dart';
import 'package:ibaozi/util/size_util.dart';

const cardConsts = [
  {},
  {
    "author": "Marco",
    "action": "added 127 new photos to Lorem ipsum dolr sit amet.",
    "content": "",
    "time": "1 分钟以前",
    "like": "123",
    "chat": "67",
    "share": "12",
    "images_number": "+126",
    "avatar_image": "images/avatar.jpg",
    "images": [
      FeedImage.feed13_pic1,
      FeedImage.feed13_pic2,
      FeedImage.feed13_pic4,
    ]
  },
  {
    "author": "i校长",
    "action": "看Android的发展历程-谈一下当下最合适的架构",
    "content": "上次我们讲到一个好的架构有哪些优点，当然好的架构肯定还有其他方面的优势，有问题欢迎反驳，我们一起讨论。",
    "time": "12 小时以前",
    "like": "1232",
    "chat": "1",
    "share": "3",
    "images_number": '0',
    "avatar_image": "images/avatar_xiaozhang.jpg",
    "images": [
      FeedImage.feed13_pic1,
      FeedImage.feed13_pic2,
    ]
  },
  {
    "author": "i校长",
    "action": "两年后我对Android 架构的思考",
    "content": "好的架构应该有的优势:大道至简、抽丝剥茧、万变不离其宗、领域驱动",
    "time": "2 个月以前",
    "like": "12",
    "chat": "1",
    "share": "3",
    "images_number": '0',
    "avatar_image": "images/avatar_xiaozhang.jpg",
    "images": [
      FeedImage.feed13_pic1,
      FeedImage.feed13_pic2,
    ]
  },
];

class BlogLists extends StatefulWidget {
  @override
  _BlogListsState createState() => _BlogListsState();
}

var deviceHeight;
var deviceWidth;
Icon favIcon = Icon(Icons.favorite_border);
Icon chatIcon = Icon(Icons.chat);
Icon shareIcon = Icon(Icons.share);

class _BlogListsState extends State<BlogLists> {
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: [YELLOW, GREEN])),
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _cardClipper(),
            TopTitleBar(),
          ],
        ),
      ),
    );
  }

  Widget timeText(index) => Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Text(
          cardConsts[index]['time'],
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Colors.black38,
              fontSize: SizeUtil.getAxisBoth(TEXT_SMALL_2_SIZE)),
        ),
      );

  Widget descriptionText(index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                  text: '${cardConsts[index]['author']} ',
                  style: TextStyle(
                      fontSize: SizeUtil.getAxisBoth(TEXT_NORMAL_SIZE),
                      fontWeight: FontWeight.bold,
                      color: TEXT_BLACK),
                  children: <TextSpan>[
                    TextSpan(
                        text: cardConsts[index]['action'],
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: TEXT_BLACK_LIGHT)),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Text('${cardConsts[index]['content']} '),
            )
          ],
        ),
      );

  Widget _socialAction(Icon icon, String number) => Container(
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(width: 7),
            Text(
              '$number',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: SizeUtil.getAxisBoth(TEXT_SMALL_2_SIZE)),
            )
          ],
        ),
      );

  Widget _socialActionRow(index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _socialAction(favIcon, cardConsts[index]['like']),
          _socialAction(chatIcon, cardConsts[index]['chat']),
          _socialAction(shareIcon, cardConsts[index]['share'])
        ],
      ),
    );
  }

  Widget _cardDetails(index) {
    return Column(
      children: <Widget>[
        timeText(index),
        Expanded(child: descriptionText(index)),
        _socialActionRow(index)
      ],
    );
  }

  Widget _pinkCard(index) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        height: deviceHeight * 0.3,
        width: deviceWidth * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            boxShadow: SHADOW,
            gradient: LinearGradient(colors: [RED_LIGHT, RED])),
        child: _cardDetails(index),
      ),
    );
  }

  Widget _avatarCard(index) {
    return Positioned(
        top: deviceHeight * 0.027,
        left: deviceWidth * 0.2,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
                image: AssetImage(cardConsts[index]['avatar_image'])),
            boxShadow: SHADOW,
          ),
        ));
  }

  Widget _stackClipperCard(index) {
    if (index == 0)
      return SizedBox(
        height: 100,
      );
    return Stack(
      children: <Widget>[
        _pinkCard(index),
        _avatarCard(index),
      ],
    );
  }

  Widget _cardClipper() {
    return Container(
      child: ListView.builder(
          itemCount: cardConsts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/blogDetail");
              },
              child: _stackClipperCard(index),
            );
          }),
    );
  }
}
