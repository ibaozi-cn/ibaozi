import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibaozi/about/assets.dart';
import 'package:ibaozi/about/education.dart';
import 'package:ibaozi/about/fonts.dart';
import 'package:ibaozi/about/responsive_widget.dart';
import 'package:ibaozi/about/screen_utils.dart';
import 'package:ibaozi/about/strings.dart';
import 'package:ibaozi/about/text_styles.dart';
import 'package:ibaozi/blog/blog_tabs.dart';
import 'package:ibaozi/blogger/home_blogger.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: !ResponsiveWidget.isSmallScreen(context)
                ? (ScreenUtil.getInstance().setWidth(108))
                : (ScreenUtil.getInstance().setWidth(6))), //144
        child: Scaffold(
//          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(context),
          drawer: _buildDrawer(context),
          body: _getDrawerItemWidget(_selectedDrawerIndex),
        ),
      ),
    );
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return LayoutBuilder(builder: (context, constraints) {
          return _buildBody(context, constraints);
        });
      case 1:
        return HomeBlogger();
      case 2:
        return BlogTabs();
      case 3:
        return BlogTabs();
      case 4:
        return BlogTabs();
    }
  }

  //AppBar Methods:-------------------------------------------------------------
  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      title: _buildTitle(),
      backgroundColor: Color(0xFFf1f3f4),
      elevation: 0.0,
      actions: !ResponsiveWidget.isSmallScreen(context)
          ? _buildActions(context)
          : null,
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: Strings.portfoli,
            style: TextStyles.logo,
          ),
          TextSpan(
            text: Strings.o,
            style: TextStyles.logo.copyWith(
              color: Color(0xFF50AFC0),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      MaterialButton(
        child: Text(
          Strings.menu_home,
          style: TextStyles.menu_item,
        ),
        onPressed: () {
          setState(() {
            _selectedDrawerIndex = 2;
          });
          if (ResponsiveWidget.isSmallScreen(context)) Navigator.pop(context);
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_contribute,
          style: TextStyles.menu_item,
        ),
        onPressed: () {
          setState(() {
            _selectedDrawerIndex = 4;
          });
          if (ResponsiveWidget.isSmallScreen(context)) Navigator.pop(context);

        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_message,
          style: TextStyles.menu_item,
        ),
        onPressed: () {
          setState(() {
            _selectedDrawerIndex = 3;
          });
          if (ResponsiveWidget.isSmallScreen(context)) Navigator.pop(context);

        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_contact,
          style: TextStyles.menu_item,
        ),
        onPressed: () {
          setState(() {
            _selectedDrawerIndex = 1;
          });
          if (ResponsiveWidget.isSmallScreen(context)) Navigator.pop(context);

        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_about,
          style: TextStyles.menu_item.copyWith(
            color: Color(0xFF50AFC0),
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedDrawerIndex = 0;
          });
          if (ResponsiveWidget.isSmallScreen(context)) Navigator.pop(context);

        },
      ),
    ];
  }

  Widget _buildDrawer(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Drawer(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: _buildActions(context),
            ),
          )
        : null;
  }

  //Screen Methods:-------------------------------------------------------------
  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
        child: ResponsiveWidget(
          largeScreen: _buildLargeScreen(context),
          mediumScreen: _buildMediumScreen(context),
          smallScreen: _buildSmallScreen(context),
        ),
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildContent(context)),
                _buildIllustration(),
              ],
            ),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildContent(context)),
              ],
            ),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(flex: 1, child: _buildContent(context)),
          Divider(),
          _buildCopyRightText(context),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
          _buildSocialIcons(context),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
        ],
      ),
    );
  }

  // Body Methods:--------------------------------------------------------------
  Widget _buildIllustration() {
    return Image.asset(
      Assets.programmer3,
      height: ScreenUtil.getInstance().setWidth(345), //480.0
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 0.0),
        _buildAboutMe(context),
        SizedBox(height: 4.0),
        _buildHeadline(context),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 24.0),
        _buildSummary(),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 48.0),
        ResponsiveWidget.isSmallScreen(context)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildEducation(),
                  SizedBox(height: 24.0),
                  _buildSkills(context),
                ],
              )
            : _buildSkillsAndEducation(context)
      ],
    );
  }

  Widget _buildAboutMe(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: Strings.about,
            style: TextStyles.heading.copyWith(
              fontFamily: Fonts.nexa_light,
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 45.0,
            ),
          ),
          TextSpan(
            text: Strings.me,
            style: TextStyles.heading.copyWith(
              color: Color(0xFF50AFC0),
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 45.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    return Text(
      ResponsiveWidget.isSmallScreen(context)
          ? Strings.headline
          : Strings.headline.replaceFirst(RegExp(r' f'), '\nf'),
      style: TextStyles.sub_heading,
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: EdgeInsets.only(right: 80.0),
      child: Text(
        Strings.summary,
        style: TextStyles.body,
      ),
    );
  }

  Widget _buildSkillsAndEducation(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _buildEducation(),
        ),
        SizedBox(width: 40.0),
        Expanded(
          flex: 1,
          child: _buildSkills(context),
        ),
      ],
    );
  }

  // Skills Methods:------------------------------------------------------------
  final skills = [
    'Java',
    'Kotlin',
    'Dart',
    'Flutter',
    'Android',
    'React',
    'Jenkins',
    'React Native',
    '小程序',
    'Scrum Master',
    'Js',
    'NodeJs',
    'Docker',
    'Python',
    'JVM',
    'Git',
    'JIRA',
  ];

  Widget _buildSkills(BuildContext context) {
    final List<Widget> widgets = skills
        .map((skill) => Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: _buildSkillChip(context, skill),
            ))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSkillsContainerHeading(),
        Wrap(children: widgets),
//        _buildNavigationArrows(),
      ],
    );
  }

  Widget _buildSkillsContainerHeading() {
    return Text(
      Strings.skills_i_have,
      style: TextStyles.sub_heading,
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyles.chip.copyWith(
          fontSize: ResponsiveWidget.isSmallScreen(context) ? 10.0 : 11.0,
        ),
      ),
    );
  }

  // Education Methods:---------------------------------------------------------
  final educationList = [
    Education(
      '10 2018',
      '-至今',
      '居理新房',
      'Android System Engineer',
    ),
    Education(
      '9 2017',
      '-10 2018',
      '车多多',
      'Android Software Engineer',
    ),
    Education(
      '2 2014',
      '-5 2016',
      '中和农信',
      'Android Software Engineer',
    ),
  ];

  Widget _buildEducation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildEducationContainerHeading(),
        _buildEducationSummary(),
        SizedBox(height: 8.0),
        _buildEducationTimeline(),
      ],
    );
  }

  Widget _buildEducationContainerHeading() {
    return Text(
      Strings.experience,
      style: TextStyles.sub_heading,
    );
  }

  Widget _buildEducationSummary() {
    return Text(
      '性能的关键是精简，而不是一堆的优化用例。除非有真正显著的效果，否则一定要忍住你那些蠢蠢欲动的小微调的企图。',
      style: TextStyles.body,
    );
  }

  Widget _buildEducationTimeline() {
    final List<Widget> widgets = educationList
        .map((education) => _buildEducationTile(education))
        .toList();
    return Column(children: widgets);
  }

  Widget _buildEducationTile(Education education) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '${education.post}',
            style: TextStyles.company,
          ),
          Text(
            '${education.organization}',
            style: TextStyles.body.copyWith(
              color: Color(0xFF45405B),
            ),
          ),
          Text(
            '${education.from}-${education.to}',
            style: TextStyles.body,
          ),
        ],
      ),
    );
  }

  // Footer Methods:------------------------------------------------------------
  Widget _buildFooter(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                child: _buildCopyRightText(context),
                alignment: Alignment.centerLeft,
              ),
              Align(
                child: _buildSocialIcons(context),
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCopyRightText(BuildContext context) {
    return Text(
      Strings.rights_reserved,
      style: TextStyles.body1.copyWith(
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 8 : 10.0,
      ),
    );
  }

  Widget _buildSocialIcons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("微信号",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  content: Text("ai_xiaoduo_com",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: 'ai_xiaoduo_com'));
                          Navigator.of(context).pop();
                        },
                        child: Text('复制')),
                  ],
                ));
          },
          child: Image.asset(
            Assets.weixin,
            color: Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("QQ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  content: Text("1608889789",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: '1608889789'));
                          Navigator.of(context).pop();
                        },
                        child: Text('复制')),
                  ],
                ));
          },
          child: Image.asset(
            Assets.qq,
            color: Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            launch("https://www.jianshu.com/u/77699cd41b28");
          },
          child: Image.asset(
            Assets.jianshu,
            color: Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            launch("mailto:zzy0523@gmail.com");
          },
          child: Image.asset(
            Assets.gmail,
            color: Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
      ],
    );
  }
}
