import 'package:flutter/material.dart';
import 'package:wave_progress_widget/wave_progress.dart';

// ignore: must_be_immutable
class PortfolioShowcase extends StatelessWidget {
  var theme;
  var textTheme;

  List<Widget> _buildItems() {
    var items = <Widget>[];
    var contain = Container(
        width: 168.0,
        height: 168.0,
        child: Stack(
          children: <Widget>[
            Center(
              child:
                  WaveProgress(180.0, Colors.blueAccent, Colors.blueAccent, 80),
            ),
            Center(
              child: Text(
                'Java',
                style: textTheme.title.copyWith(color: Colors.white),
              ),
            )
          ],
        ));

    var contain1 = Container(
      width: 168.0,
      height: 168.0,
      child: Stack(
        children: <Widget>[
          Center(
              child: WaveProgress(
                  180.0, Colors.greenAccent, Colors.greenAccent, 40)),
          Center(
            child: Text(
              'Flutter',
              style: textTheme.title.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );

    var contain2 = Container(
        width: 168.0,
        height: 168.0,
        child: Stack(
          children: <Widget>[
            Center(
              child: WaveProgress(
                  180.0, Colors.amberAccent, Colors.amberAccent, 90),
            ),
            Center(
              child: Text(
                'Kotlin',
                style: textTheme.title.copyWith(color: Colors.white),
              ),
            )
          ],
        ));

    var contain3 = Container(
        width: 168.0,
        height: 168.0,
        child: Stack(
          children: <Widget>[
            Center(
              child: WaveProgress(
                  180.0, Colors.deepOrangeAccent, Colors.deepOrangeAccent, 30),
            ),
            Center(
              child: Text(
                'Python',
                style: textTheme.title.copyWith(color: Colors.white),
              ),
            )
          ],
        ));

    var contain4 = Container(
        width: 168.0,
        height: 168.0,
        child: Stack(
          children: <Widget>[
            Center(
              child: WaveProgress(
                  180.0, Colors.deepPurpleAccent, Colors.deepPurpleAccent, 70),
            ),
            Center(
              child: Text(
                'JS',
                style: textTheme.title.copyWith(color: Colors.white),
              ),
            )
          ],
        ));

    var contain5 = Container(
        width: 168.0,
        height: 168.0,
        child: Stack(
          children: <Widget>[
            Center(
              child:
                  WaveProgress(180.0, Colors.cyanAccent, Colors.cyanAccent, 50),
            ),
            Center(
              child: Text(
                'NodeJs',
                style: textTheme.title.copyWith(color: Colors.white),
              ),
            )
          ],
        ));

    items.add(contain);
    items.add(contain1);
    items.add(contain2);
    items.add(contain3);
    items.add(contain4);
    items.add(contain5);

    return items;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    textTheme = theme.textTheme;

    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return new GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: _buildItems(),
    );
  }
}
