import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:ibaozi/const/gradient_const.dart';
import 'package:ibaozi/home/responsive_widget.dart';
import 'package:ibaozi/home/text_styles.dart';
import 'package:ibaozi/jetpack/dependence_item.dart';
import 'package:ibaozi/jetpack/dependencies.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';

class JetPackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JetPackPageState();
  }
}

class JetPackPageState extends State<JetPackPage> {
  var _dependenciesBasicListData =
      Dependencies.selectDependenciesDataForBasic();
  var _dependenciesArcListData = Dependencies.selectDependenciesDataForArc();
  var _dependenciesListBehaviorData =
      Dependencies.selectDependenciesDataForBehavior();
  var _dependenciesUIListData = Dependencies.selectDependenciesDataForUI();

  var _appName = "";
  var _packageName = "";
  var _minSdk = "";

  var _toast = "目前处于测试阶段，使用中遇到问题，欢迎反馈哦，为了缓解服务器压力，做了一定的限流哦，理解万岁，珍惜使用次数哦，祝您生活愉快哦";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return _buildRootView(context, constraints);
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

  _buildRootView(BuildContext context, BoxConstraints constraints) {

    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: ResponsiveWidget(
                largeScreen: _buildLargeScreen(context),
                mediumScreen: _buildMediumScreen(context),
                smallScreen: _buildSmallScreen(context),
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            gradient: TRANSPARENT_BACKGROUND,
          ),
          child: FloatingActionButton(
            backgroundColor: Color(0xFF50AFC0),
            hoverColor: Color(0xFF90AFC9),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AssetGiffyDialog(
                        buttonCancelColor: Colors.black26,
                        image: Image.asset('images/programer.gif'),
                        title: Text(
                          '确定要生成吗？',
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600),
                        ),
                        description: Text(
                          _toast,
                          textAlign: TextAlign.center,
                          style: TextStyles.body.copyWith(fontSize: 18),
                        ),
                        entryAnimation: EntryAnimation.RIGHT,
                        buttonOkColor: Color(0xFF50AFC0),
                        onOkButtonPressed: () {
                          Navigator.of(context).pop();
                          print(_appName);
                          print(_packageName);
                          print(_minSdk);
                          if (_appName.isEmpty) {
                            BotToast.showText(text: "请输入项目名称");
                          } else {
                            if (_packageName.isEmpty) {
                              BotToast.showText(text: "请输入包名");
                            } else {
                              if (!_packageName.contains(".")) {
                                BotToast.showText(
                                    text: "请输入正确的包名格式 如: com.aaa.bbb");
                              } else {
                                postHttp(_appName, _packageName, _minSdk);
                                BotToast.showLoading();
                              }
                            }
                          }
                        },
                      ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Icon(Icons.android), Text("完成")],
            ),
          ),
        ));
  }

  _buildLargeScreen(context) {
    var _size = 25.0;
    var _sizeHeight = 50.0;
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16),
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
              _buildInputAppName("application"),
              SizedBox(
                width: _size,
              ),
              _buildTitle("Package.", "name"),
              SizedBox(
                width: _size,
              ),
              _buildInputPackageName("com.packages.app"),
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
            child: _buildTitle("Architecture", "  以下内容努力适配中"),
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
            child: _buildTitle("Dependencies", "  以下内容努力适配中"),
          ),
          SizedBox(
            height: _sizeHeight,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: _buildSwitchForDependence("基础", _lightsBasic, (state) {
              setState(() {
                _lightsBasic = state;
              });
            }),
          ),
          _lightsBasic
              ? _buildGridView(_dependenciesBasicListData)
              : SizedBox(
                  height: 1,
                ),
          Align(
            alignment: Alignment.topLeft,
            child: _buildSwitchForDependence("架构", _lightsArc, (state) {
              setState(() {
                _lightsArc = state;
              });
            }),
          ),
          _lightsArc
              ? _buildGridView(_dependenciesArcListData)
              : SizedBox(
                  height: 1,
                ),
          Align(
            alignment: Alignment.topLeft,
            child: _buildSwitchForDependence("行为", _lightsBehavior, (state) {
              setState(() {
                _lightsBehavior = state;
              });
            }),
          ),
          _lightsBehavior
              ? _buildGridView(_dependenciesListBehaviorData)
              : SizedBox(
                  height: 1,
                ),
          Align(
            alignment: Alignment.topLeft,
            child: _buildSwitchForDependence("界面", _lightsUi, (state) {
              setState(() {
                _lightsUi = state;
              });
            }),
          ),
          _lightsUi
              ? _buildGridView(_dependenciesUIListData)
              : SizedBox(
                  height: 1,
                ),
        ],
      ),
    );
  }

  _buildHorizontalListView(dataList) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          Dependencies dependencies = dataList.elementAt(index);
          return DependenceItem(dependencies);
        },
      ),
    );
  }

  _buildGridView(dataList) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: dataList.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            Dependencies dependencies = dataList.elementAt(index);
            return DependenceItem(dependencies);
          }),
    );
  }

  bool _lightsKotlin = false;
  bool _lightsBasic = true;
  bool _lightsArc = false;
  bool _lightsBehavior = false;
  bool _lightsUi = false;

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

  _buildSwitchSmall(title, lights, onChange) {
    return Container(
      width: 180,
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

  _buildSwitchForDependence(title, lights, onChange) {
    return Container(
      width: 200,
      child: SwitchListTile(
          activeColor: Color(0xFF50AFC0),
          title: Text(
            title,
            style: TextStyles.sub_heading.copyWith(color: Color(0xFF50AFC0)),
          ),
          value: lights,
          onChanged: onChange),
    );
  }

  _buildInputAppName(label) {
    return Container(
      width: 200,
      child: TextField(
        inputFormatters: [
          WhitelistingTextInputFormatter(
            RegExp("[a-zA-Z]|[0-9]")
          ),
          LengthLimitingTextInputFormatter(100)
        ],
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: label),
        onChanged: (text) {
          setState(() {
            _appName = text;
          });
        },
        autofocus: false,
      ),
    );
  }

  _buildInputPackageName(label) {
    return Container(
      width: 200,
      child: TextField(
        inputFormatters: [
          WhitelistingTextInputFormatter(
              RegExp("[a-zA-Z]|[0-9]|[.]")
          ),
          LengthLimitingTextInputFormatter(100)
        ],
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: label),
        onChanged: (text) {
          setState(() {
            _packageName = text;
          });
        },
        autofocus: false,
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
      margin: EdgeInsets.only(left: 16),
      child: DropdownButton(
          value: _selectItValue,
          hint: Text("please seclet minimum api"),
          items: Constant.buildMinimumApiList(),
          onChanged: (button) {
            setState(() {
              _selectItValue = button;
            });
            _minSdk = button;
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
    return _buildSmallScreen(context);
  }

  _buildSmallScreen(context) {
    var _size = 25.0;
    var _sizeHeight = 25.0;
    return Container(
        margin: EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildTitle("Project.", "name"),
                _buildInputAppName("application"),
              ],
            ),
            SizedBox(
              height: _sizeHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildTitle("Package.", "name"),
                _buildInputPackageName("com.packages.app"),
              ],
            ),
            SizedBox(
              height: _sizeHeight,
            ),
            _buildTitle("Language", ""),
            SizedBox(
              height: _sizeHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildSwitchSmall("Java", true, (state) {}),
                _buildSwitchSmall("Kotlin", _lightsKotlin, (state) {
                  setState(() {
                    _lightsKotlin = state;
                  });
                }),
              ],
            ),
            SizedBox(
              height: _sizeHeight,
            ),
            _buildTitle("Minimum API Level", ""),
            SizedBox(
              height: _sizeHeight,
            ),
            _buildDropDownButtonList(),
            SizedBox(
              height: _sizeHeight,
            ),
            _buildTitle("Architecture", ""),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
            ),
            _buildTitle("Dependencies", ""),
            SizedBox(
              height: _sizeHeight,
            ),
            _buildSwitchForDependence("基础", _lightsBasic, (state) {
              setState(() {
                _lightsBasic = state;
              });
            }),
            _lightsBasic
                ? _buildHorizontalListView(_dependenciesBasicListData)
                : SizedBox(
                    height: 1,
                  ),
            _buildSwitchForDependence("架构", _lightsArc, (state) {
              setState(() {
                _lightsArc = state;
              });
            }),
            _lightsArc
                ? _buildHorizontalListView(_dependenciesArcListData)
                : SizedBox(
                    height: 1,
                  ),
            _buildSwitchForDependence("行为", _lightsBehavior, (state) {
              setState(() {
                _lightsBehavior = state;
              });
            }),
            _lightsBehavior
                ? _buildHorizontalListView(_dependenciesListBehaviorData)
                : SizedBox(
                    height: 1,
                  ),
            _buildSwitchForDependence("界面", _lightsUi, (state) {
              setState(() {
                _lightsUi = state;
              });
            }),
            _lightsUi
                ? _buildHorizontalListView(_dependenciesUIListData)
                : SizedBox(
                    height: 1,
                  ),
          ],
        ));
  }

  void postHttp(appName, packageName, minSdk) async {
    try {
//      var url = "http://127.0.0.1:3001/generator";
      var url = "https://bot.csrbobo.com/generator";
      var params = Map<String, String>();
      params["app_name"] = appName;
      params["package_name"] = packageName;
      params["min_sdk"] = minSdk;
      var client = http.Client();
      http.Response response = await client.post(url, body: params);
      BotToast.closeAllLoading();
      var body = response.body;
      var result = JsonDecoder().convert(body) as Map;
      print(result["status"]);
      print(result["msg"]);
      print(result["data"]);
      if (result["status"] == "200") {
        BotToast.showText(text: "地址已生成，已自动放至剪切板");
        Clipboard.setData(ClipboardData(text: result["data"]));
        launch(result["data"]);
      } else {
        BotToast.showText(
            text: result["msg"], duration: Duration(milliseconds: 3000));
      }
    } catch (e) {
      print(e.toString());
      BotToast.showText(text: e.toString());
      BotToast.closeAllLoading();
    }
  }
}
