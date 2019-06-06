import 'package:cdapp/Components/CDOpacityContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../Components/customShadow.dart';

enum CarefillResponse { next_requested, next_confirmed, nil }

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

class NextDose {
  String nextDoseTime;
  String nextDoseDate;
  String nextDoseDay;
  String nextDoseDirection;
  int nextDoseID;
  NextDose({
    this.nextDoseTime,
    this.nextDoseDate,
    this.nextDoseDay,
    this.nextDoseDirection,
    this.nextDoseID,
  });
  factory NextDose.fromJson(Map<String, dynamic> json) {
    return NextDose(
      nextDoseTime: json['time'],
      nextDoseDate: json['date'],
      nextDoseDay: json['day'],
      nextDoseDirection: json['direction'],
      nextDoseID: json['id'],
    );
  }
}

class Carefill {
  // CarefillResponse carefillResponse;
  int carefillID;
  String carefillResponse;
  int carefillDuration;
  Carefill({
    this.carefillID,
    this.carefillResponse,
    this.carefillDuration,
  });
  factory Carefill.fromJson(Map<String, dynamic> json) {
    return Carefill(
      carefillID: json['id'],
      carefillResponse: json['response'],
      carefillDuration: json['duration'],
    );
  }
}

class NextCarefill {
  String nextCarefillStartDate;
  String nextCarefillEndDate;
  int nextCarefillID;
  int nextCarefillOrderID;
  NextCarefill({
    this.nextCarefillStartDate,
    this.nextCarefillEndDate,
    this.nextCarefillID,
    this.nextCarefillOrderID,
  });
  factory NextCarefill.fromJson(Map<String, dynamic> json) {
    return NextCarefill(
      nextCarefillStartDate: json['carefill_start_date'],
      nextCarefillEndDate: json['carefill_end_date'],
      nextCarefillID: json['id'],
      nextCarefillOrderID: json['order_id'],

      //       nextCarefillStartDate: json['carefill_start_date']!=null?json['carefill_start_date']:'',
      // nextCarefillEndDate: json['carefill_end_date']!=null?json['carefill_end_date']:'',
      // nextCarefillID: json['id']!=null?json['id']:0,
      // nextCarefillOrderID: json['order_id']!=null?json['order_id']:0,
    );
  }
}

class Adherence {
  int adherenceOnTime;
  int adherenceLate;
  int adherenceMissed;
  Adherence({
    this.adherenceOnTime,
    this.adherenceLate,
    this.adherenceMissed,
  });
  factory Adherence.fromJson(Map<String, dynamic> json) {
    return Adherence(
      adherenceOnTime: json['on_time'],
      adherenceLate: json['late'],
      adherenceMissed: json['missed'],
    );
  }
}

class Partner {
  String partnerName;
  String partnerPhoneNumber;
  String partnerLogo;
  Partner({
    this.partnerName,
    this.partnerPhoneNumber,
    this.partnerLogo,
  });
  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      partnerName: json['name'],
      partnerPhoneNumber: json['phone_number'],
      partnerLogo: json['logo'],
    );
  }
}

class User {
  String userFName;
  String userLName;
  String userProfilePicURL;
  User({
    this.userFName,
    this.userLName,
    this.userProfilePicURL,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userFName: json['first_name'],
      userLName: json['last_name'],
      userProfilePicURL: json['profile_photo_url'],
    );
  }
}

class HomeStatus {
  NextDose nextDose;
  Carefill carefill;
  NextCarefill nextCarefill;
  Adherence adherence;
  Partner partner;
  User user;

  HomeStatus({
    this.nextDose,
    this.carefill,
    this.nextCarefill,
    this.adherence,
    this.partner,
    this.user,
  });
  HomeStatus.fromJson(Map<String, dynamic> json)
      : nextDose = NextDose.fromJson(json['next_dose']),
        carefill = Carefill.fromJson(json['carefill']),
        nextCarefill = NextCarefill.fromJson(json['next_carefill']),
        adherence = Adherence.fromJson(json['adherence']),
        partner = Partner.fromJson(json['partner']),
        user = User.fromJson(json['user']);
}

const baseUrl = "http://192.168.86.73:3000/api/users/home_info.json";

class _Home extends State<Home> {
  HomeStatus status;

  _getState() {
    // var response = json.encode([
    // ]);
    http.get(baseUrl, headers: {
      "Authorization":
          "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTk3MjY1NzAsInN1YiI6Mn0.rbdHsS81VoSvAlSR7w-ZfMT5oPwyiVIXs4hz_MGUzHk"
    }).then((http.Response response) {
      print(response);
      setState(() {
        Map<String, dynamic> item = json.decode(response.body);
        // status = HomeStatus.fromJson(item);
        status = HomeStatus.fromJson(item);
      });
    }).catchError((error) {
      print(error);
    });
  }

  int _getAdherencePercentage() {
    if (status != null) {
      int onTime = status.adherence.adherenceOnTime;
      int lateMed = status.adherence.adherenceLate;
      int missed = status.adherence.adherenceMissed;
      if (onTime != null && lateMed != null && missed != null) {
        int total = onTime + lateMed + missed;
        return ((onTime / total) * 100).round();
      }
    }
    return -1;
  }

  initState() {
    super.initState();

    _getState();
  }

  _nextDoseDay() {
    DateTime now = new DateTime.now();
    // var todayDate = DateTime(2019, 06, 06, 00, 00);
    var todayDate = DateTime(now.year, now.month, now.day, 00, 00);
    var formatter = DateFormat('dd/MMM/yyyy');
    var formater = DateFormat('dd/MMM/yyyy hh :mm :ss');
    List<String> dateNextDose = status.nextDose.nextDoseDate.split('/');
    var nextDate = DateTime(int.parse(dateNextDose[2]),
        int.parse(dateNextDose[1]), int.parse(dateNextDose[0]),00,00);
    // todayDate = todayDate.subtract(Duration(hours: 5, minutes: 30));
    print("------------------------");
    print(formatter.format(nextDate));
    print(status.nextDose.nextDoseDate);
    var diff = nextDate.difference(todayDate);
    print(diff.inHours);
    print(diff.inDays);
    print(todayDate);
    print(nextDate);

    if (diff.inDays > 3) {
      var formatterTemp = DateFormat('dd MMM, ');
      return formatterTemp.format(nextDate);
    } else if (diff.inDays == 3 || diff.inDays == 2) {
      var formatterTemp = DateFormat('EEE, ');
      return formatterTemp.format(nextDate);
    } else if (diff.inDays == 1) {
      return 'Tomorrow, ';
    } else if (diff.inDays == 0) {
      return 'Today, ';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    var data;
    status != null
        ? data = [
            new ClicksPerYear('On Time', status.adherence.adherenceOnTime,
                const Color(0xff009900)),
            new ClicksPerYear('Late', status.adherence.adherenceLate,
                const Color(0xffdddd00)),
            new ClicksPerYear('Missed', status.adherence.adherenceMissed,
                const Color(0xfff3898a)),
          ]
        : data = null;

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
        height: 170.0,
        child: chart,
      ),
    );

    return status != null
        ? Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.dstATop),
              ),
            ),
            padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                              fontSize: 38,
                            ),
                          ),
                          Image.asset('./assets/LogoOnly.png', height: 30),
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(child: chartWidget),
                          Container(
                            height: 170,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    height: 85,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(1000),
                                      child: Image.network(
                                        status.user.userProfilePicURL,
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        status.user.userFName + ' ' + status.user.userLName,
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        _getAdherencePercentage().toString() + '% Adherence',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Container(
                          height: 340,
                          color: Color(0x00000000),
                          child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 1.0,
                            padding: const EdgeInsets.all(6.0),
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            children: <Widget>[
                              GridTile(
                                  child: Card(
                                      color: Color(0x445CC7D8),
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    'Next Dose',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xff000000),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  status.nextDose.nextDoseTime,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xffffffff),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                  ),
                                                ),
                                                Text(
                                                  _nextDoseDay() +
                                                      '' +
                                                      status.nextDose
                                                          .nextDoseDirection,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xffffffff),
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
                                                    horizontal: 25,
                                                    vertical: 0),
                                                child: Text(
                                                  'Mark as Taken',
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xffffffff),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                onPressed: () => {},
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                              GridTile(
                                  child: Card(
                                color: Color(0x44EC4D62),
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            status.carefill.carefillDuration
                                                .toString(),
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
                                          onPressed: () => {
                                                if (status.nextCarefill != null)
                                                  {
                                                    //go to SC2 with check over teddy
                                                    print('sc2 check1')
                                                  }
                                                else
                                                  if (status.carefill
                                                              .carefillResponse !=
                                                          "next_requested" ||
                                                      status.carefill
                                                              .carefillResponse !=
                                                          "next_confirmed")
                                                    {
                                                      //go to 1
                                                      print('cr1')
                                                    }
                                                  else
                                                    if (status.carefill
                                                            .carefillResponse ==
                                                        "next_requested")
                                                      {
                                                        // go to 3
                                                        print('sc2 3 dots')
                                                      }
                                                    else
                                                      if (status.carefill
                                                              .carefillResponse ==
                                                          "next_confirmed")
                                                        {
                                                          // go to 2
                                                          print('sc2 check2')
                                                        }
                                              },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                              GridTile(
                                  child: Card(
                                      color: Color(0x44EC4D62),
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Image.network(
                                                status.partner.partnerLogo,
                                                height: 75),
                                            Container(
                                              margin: EdgeInsets.all(0),
                                              padding: EdgeInsets.all(0),
                                              child: ButtonTheme(
                                                minWidth: double.infinity,
                                                child: RaisedButton(
                                                  color: Colors.green,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 0),
                                                  child: Text(
                                                    'Call ' +
                                                        status.partner
                                                            .partnerName,
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xffffffff),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  onPressed: () => {},
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                              GridTile(
                                  child: Card(
                                      color: Color(0x445CC7D8),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    'Get in touch',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xff000000),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Image.asset('assets/LogoOnly.png',
                                                height: 30),
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
                                                          EdgeInsets.symmetric(
                                                              vertical: 0),
                                                      child: Text(
                                                        'Call CAREDOSE',
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xffffffff),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      onPressed: () => {},
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ))
        : Container();
  }
}
