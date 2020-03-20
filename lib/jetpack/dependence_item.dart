import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibaozi/jetpack/dependencies.dart';

class DependenceItem extends StatefulWidget {
  Dependencies _dependencies;

  DependenceItem.name(this._dependencies);

  @override
  State<StatefulWidget> createState() {
    return DependenceItemStatus();
  }
}

class DependenceItemStatus extends State<DependenceItem> {
  @override
  Widget build(BuildContext context) {
    return _buildCard(
        this.widget._dependencies.selected,
        this.widget._dependencies.title,
        this.widget._dependencies.subTitle,
        this.widget._dependencies.url,
        this.widget._dependencies.onlyDependence);
  }

  _buildCard(isSelected, title, subtitle, url, isOnlyDependence) {
    double topBottomPadding = 16.0;
    return InkWell(
      onTap: () {
        setState(() {
          this.widget._dependencies.selected =
              !this.widget._dependencies.selected;
        });
      },
      child: Card(
        color: isSelected ? Color(0xFF50AFC0) : Colors.white,
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
                      color: isSelected ? Colors.white : Color(0xFF50AFC0),
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    color: isOnlyDependence ? Colors.black87 : Colors.white,
                    child: Text(
                      '默认依赖',
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            color:
                                isOnlyDependence ? Colors.amber : Colors.black,
                          ),
                    ),
                    onPressed: () {
                      setState(() {
                        this.widget._dependencies.onlyDependence = true;
                        this.widget._dependencies.selected = true;
                      });
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  MaterialButton(
                    color: isOnlyDependence ? Colors.white : Colors.black87,
                    child: Text(
                      '添加用例',
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            color:
                                isOnlyDependence ? Colors.black : Colors.amber,
                          ),
                    ),
                    onPressed: () {
                      setState(() {
                        this.widget._dependencies.onlyDependence = false;
                        this.widget._dependencies.selected = true;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
