import 'package:cdapp/Components/CDOpacityContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../Components/customShadow.dart';

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
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
        height: 140.0,
        child: chart,
      ),
    );

    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Home',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        ),
                      ),
                      Image.asset('assets/LogoOnly.png', height: 50)
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(child: chartWidget),
                      Container(
                        height: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 70,
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
                  Text(
                    'Savani Somany',
                    style: TextStyle(
                      color: const Color(0xff494949),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '75% Adherence :|',
                    style: TextStyle(
                      color: const Color(0xff494949),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                      height: 364,
                      color: Colors.white,
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        padding: const EdgeInsets.all(6.0),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        children: <Widget>[
                          GridTile(
                              child: Card(
                            color: Colors.red,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'Next Dose',
                                        style: TextStyle(
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '9:00 PM',
                                      style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      'Today, after Food',
                                      style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: double.infinity,
                                  child: RaisedButton(
                                    color: Colors.green,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 0),
                                    child: Text(
                                      'Mark as Taken',
                                      style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    onPressed: () => {},
                                  ),
                                )
                              ],
                            ),)
                          )),
                          GridTile(
                              child: Card(
                            color: Colors.blue,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Carefill Info',
                                        style: TextStyle(
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '8',
                                      style: TextStyle(
                                        color: const Color(0xffdddd00),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28,
                                      ),
                                    ),
                                    Text(
                                      'days remaining',
                                      style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                ButtonTheme(
                                  minWidth: double.infinity,
                                  child: RaisedButton(
                                    color: Colors.green,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 0),
                                    child: Text(
                                      'Order next Carefill',
                                      style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    onPressed: () => {},
                                  ),
                                )
                              ],
                            ),),
                          )),
                          GridTile(
                              child: Card(
                            color: Colors.blue,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Image.asset('assets/LogoOnly.png', height: 75)
                              ],
                            ),)
                          )),
                          GridTile(
                              child: Card(
                            color: Colors.blue,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Get in touch',
                                        style: TextStyle(
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Image.asset('assets/LogoOnly.png', height: 30),
                                Column(

                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(0),
                                      padding: EdgeInsets.all(0),
                                      child: ButtonTheme(
                                        minWidth: double.infinity,
                                        child: RaisedButton(
                                          color: Colors.green,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 0),
                                          child: Text(
                                            'Call CAREDOSE',
                                            style: TextStyle(
                                              color: const Color(0xffffffff),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          onPressed: () => {},
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(0),
                                      padding: EdgeInsets.all(0),
                                      child: ButtonTheme(
                                        minWidth: double.infinity,
                                        child: RaisedButton(
                                          color: Colors.green,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 0),
                                          child: Text(
                                            'Call 98.4',
                                            style: TextStyle(
                                              color: const Color(0xffffffff),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          onPressed: () => {},
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),)
                          )),
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
