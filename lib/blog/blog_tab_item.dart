import 'package:flutter/material.dart';
import 'package:ibaozi/about/responsive_widget.dart';
import 'package:ibaozi/about/text_styles.dart';
import 'package:ibaozi/blog/blog_widget.dart';
import 'package:ibaozi/data/blog_model.dart';

class BlogTabItem extends StatefulWidget {

  List<Blog> blogs = [];

  BlogTabItem({Key key, this.blogs}) : super(key: key);

  @override
  _BlogTabItemState createState() => _BlogTabItemState();
}

class _BlogTabItemState extends State<BlogTabItem> {

  bool _loadingData = true;
  bool _showError = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _loadingData = false;
        _showError = false;
    });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingData)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (_showError) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          RaisedButton(
            child: Text(
              'Retry',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
            ),
            elevation: 0.0,
            onPressed: () {},
          )
        ],
      ));
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
                itemCount: widget.blogs.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => BlogWidget(
                    widget.blogs[index], index, widget.blogs.length)),
            RaisedButton(
                child: Text(
                  'More',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
                elevation: 0.0,
                onPressed: () => {})
          ],
        ),
      ),
    );
  }
}
