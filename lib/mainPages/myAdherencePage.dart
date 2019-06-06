import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/rendering.dart';

import '../Components/loader.dart';

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = [
      new ClicksPerYear('2016', 12, const Color(0xfff3898a)),
      new ClicksPerYear('2017', 42, const Color(0xffdddd00)),
      new ClicksPerYear('2018', 70, const Color(0xff009900)),
    ];

    var series = [
      new charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = new charts.PieChart(
      series,
      animate: true,
      defaultRenderer: new charts.ArcRendererConfig(arcWidth: 40),
    );
    var chartWidget = new Padding(
      padding: new EdgeInsets.all(0),
      child: new SizedBox(
        height: 240.0,
        child: chart,
      ),
    );

    return new Scaffold(
      body: new Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
              child: Text(
                'My Adherence',
                style: TextStyle(
                  color: const Color(0xff494949),
                  fontWeight: FontWeight.w700,
                  fontSize: 42,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(child: chartWidget),
                Container(
                  height: 240,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              './assets/LogoOnly.png',
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
            Container(
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.fromLTRB(40, 30, 40, 30),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                            child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    // color: const Color(0xff909090),
                                    border: Border(
                                        right: BorderSide(
                                  color: const Color(0xfff3898a),
                                  width: 1,
                                ))),
                                child: Column(
                                  children: <Widget>[
                                    Text('47',
                                        style: TextStyle(
                                            fontSize: 60,
                                            color: const Color(0xff009900),
                                            fontWeight: FontWeight.w500)),
                                    Text('On Time',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    // color: const Color(0xff909090),
                                    border: Border(
                                        right: BorderSide(
                                  color: const Color(0xfff3898a),
                                  width: 1,
                                ))),
                                child: Column(
                                  children: <Widget>[
                                    Text('3',
                                        style: TextStyle(
                                            fontSize: 60,
                                            color: const Color(0xffdddd00),
                                            fontWeight: FontWeight.w500)),
                                    Text('Late',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Text('8',
                                      style: TextStyle(
                                          fontSize: 60,
                                          color: const Color(0xfff3898a),
                                          fontWeight: FontWeight.w500)),
                                  Text('Missed',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ))))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                    minWidth: 110.0,
                    child: RaisedButton(
                      color: const Color(0xff5ac7d8),
                      child: Text(
                        'Current Refill',
                        style: TextStyle(color: const Color(0xffffffff)),
                      ),
                      onPressed: () => {},
                    )),
                ButtonTheme(
                    minWidth: 110.0,
                    child: RaisedButton(
                      color: const Color(0xffffffff),
                      child: Text(
                        'Lifetime',
                        style: TextStyle(color: const Color(0xff5ac7d8)),
                      ),
                      onPressed: () => {},
                    ))
              ],
            ),
            Loader(60),

          ],
        ),
      ),
    );
  }
}
