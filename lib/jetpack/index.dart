import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ibaozi/home/responsive_widget.dart';
import 'package:ibaozi/home/text_styles.dart';
import 'package:ibaozi/jetpack/dependence_item.dart';
import 'package:ibaozi/jetpack/dependencies.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constant.dart';

class JetPackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JetPackPageState();
  }
}

class JetPackPageState extends State<JetPackPage> {
  var _dependenciesListData = Dependencies.selectDependenciesDataForJetPack();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return _buildBody(context, constraints);
    });
  }

  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
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

  _buildLargeScreen(context) {
    var _size = 25.0;
    var _sizeHeight = 50.0;
    return Container(
      margin: EdgeInsets.only(left: 32, top: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildTitle("Project.", "name"),
              SizedBox(
                width: _size,
              ),
              _buildInput("default"),
              SizedBox(
                width: _size,
              ),
              _buildTitle("Package.", "name"),
              SizedBox(
                width: _size,
              ),
              _buildInput("com.package.default"),
            ],
          ),
          SizedBox(
            height: _sizeHeight,
          ),
          Row(
            children: <Widget>[
              _buildTitle("Language", ""),
              SizedBox(
                width: _size,
              ),
              _buildSwitch("Java", true, (state) {}),
              SizedBox(
                width: _size,
              ),
              _buildSwitch("Kotlin", _lightsKotlin, (state) {
                setState(() {
                  _lightsKotlin = state;
                });
              }),
            ],
          ),
          SizedBox(
            height: _sizeHeight,
          ),
          Row(
            children: <Widget>[
              _buildTitle("Minimum API Level", ""),
              SizedBox(
                width: _size,
              ),
              _buildDropDownButtonList(),
            ],
          ),
          SizedBox(
            height: _sizeHeight,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: _buildTitle("Architecture", ""),
          ),
          Row(
            children: <Widget>[
              _buildArchitectureCard(
                  0,
                  "Mvvm-Architecture",
                  "The practice of MVVM + Jetpack architecture in Android.",
                  "https://github.com/qingmei2/MVVM-Architecture"),
              _buildArchitectureCard(
                  1,
                  "Android Architecture Components Basic Sample",
                  "This sample showcases the following Architecture Components:\nRoom\nViewModels\nLiveData",
                  "https://github.com/android/architecture-components-samples/tree/master/BasicSample")
            ],
          ),
          SizedBox(
            height: _sizeHeight,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: _buildTitle("Dependencies", ""),
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: _dependenciesListData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.65),
              itemBuilder: _itemDependenceBuilderFunc)
        ],
      ),
    );
  }

  // builder
  Widget _itemDependenceBuilderFunc(BuildContext context, int index) {
    Dependencies dependencies = _dependenciesListData.elementAt(index);
    return DependenceItem.name(dependencies);
  }

  bool _lightsKotlin = false;

  _buildSwitch(title, lights, onChange) {
    return Container(
      width: 200,
      child: SwitchListTile(
          activeColor: Color(0xFF50AFC0),
          title: Text(
            title,
            style: TextStyles.sub_heading,
          ),
          value: lights,
          onChanged: onChange),
    );
  }

  _buildInput(label) {
    return Container(
      width: 200,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: label),
        onChanged: (text) {},
        autofocus: true,
      ),
    );
  }

  Widget _buildTitle(left, right) {
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
            text: left,
            style: TextStyles.logo,
          ),
          TextSpan(
            text: right,
            style: TextStyles.logo.copyWith(
              color: Color(0xFF50AFC0),
            ),
          ),
        ],
      ),
    );
  }


  var _selectItValue;

  _buildDropDownButtonList() {
    return Container(
      child: DropdownButton(
          value: _selectItValue,
          hint: Text("please seclet minimum api"),
          items: Constant.buildMinimumApiList(),
          onChanged: (button) {
            setState(() {
              _selectItValue = button;
            });
          }),
    );
  }

  var _architectureSelectIndex = -1;

  _buildArchitectureCard(index, title, subtitle, url) {
    double topBottomPadding = 16.0;
    return InkWell(
      onTap: () {
        if (_architectureSelectIndex == index) {
          setState(() {
            _architectureSelectIndex = -1;
          });
        } else
          setState(() {
            _architectureSelectIndex = index;
          });
      },
      child: Card(
        color: _architectureSelectIndex == index
            ? Color(0xFF50AFC0)
            : Colors.white,
        margin:
            EdgeInsets.fromLTRB(16.0, topBottomPadding, 16.0, topBottomPadding),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.title.copyWith(
                      color: _architectureSelectIndex == index
                          ? Colors.white
                          : Color(0xFF50AFC0),
                    ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      color: Colors.black54,
                    ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    child: Text(
                      'Jump to github',
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            color: _architectureSelectIndex == index
                                ? Colors.amber
                                : Colors.black87,
                          ),
                    ),
                    onPressed: () {
                      launch(url);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildMediumScreen(context) {
    return Text("bbb");
  }

  _buildSmallScreen(context) {
    return Text("aaa");
  }
}
