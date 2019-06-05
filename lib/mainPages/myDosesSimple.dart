import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// import 'package:apiJsonListview/API.dart';
// import 'package:apiJsonListview/models/User.dart';

import '../caredose_icons_icons.dart';
import '../Components/customShadow.dart';

enum PronterProfileEnum {
  MorningEnglish,
  AfternoonEnglish,
  EveningEnglish,
  NightEnglish
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _DoseItem {
  int index;
  int id;
  String date;
  String foodDirection;
  String medicinesDosage;
  String medicinesDetail;
  String medicinesExpiry;
  String time;
  String day;
  String adherenceStatus;
  PronterProfileEnum printerProfile;

  _DoseItem(
    int index,
    int id,
    String day,
    String time,
    String adherenceStatus,
    PronterProfileEnum printerProfile,
    String foodDirection,
    String date,
    String medicinesDosage,
    String medicinesDetail,
    String medicinesExpiry,
  ) {
    this.index;
    this.id;
    this.time;
    this.day;
    this.adherenceStatus;
    this.printerProfile;
    this.date;
    this.foodDirection;
    this.medicinesDosage;
    this.medicinesDetail;
    this.medicinesExpiry;
  }
  _DoseItem.fromJson(Map json, i)
      : index = i,
        id = json['id'],
        time = json['time'],
        day = json['day'],
        adherenceStatus = json['adherence_status'],
        printerProfile = json['printer_profile'],
        date = json['date'],
        foodDirection = json['direction'],
        medicinesDosage = json['med_quantities_in_dose'],
        medicinesDetail = json['med_names_in_dose'],
        medicinesExpiry = json['med_expiry_dates'];

  Map toJson() {
    return {
      'id': id,
      'time': time,
      'day': day,
      'adherenceStatus': adherenceStatus,
      'printerProfile': printerProfile,
      'date': date,
      'foodDirection': foodDirection,
      'medicinesDosage': medicinesDosage,
      'medicinesDetail': medicinesDetail,
      'medicinesExpiry': medicinesExpiry
    };
  }
}

const baseUrl = "http://192.168.86.73:3000/api/carefills/3468/doses.json";

class API {
  static Future getUsers() {
    var url = baseUrl;
    // String header = "authorization :";
    return http.get(url, headers: {
      HttpHeaders.authorizationHeader:
          "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTk3MjY1NzAsInN1YiI6Mn0.rbdHsS81VoSvAlSR7w-ZfMT5oPwyiVIXs4hz_MGUzHk"
    });
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool _extended = false;
  int totalCards = 20;
  int countOfTrue = 0;
  List<_DoseItem> items = [];
  List<bool> _expanded = List<bool>();

  _getUsers() {
    http.get(baseUrl, headers: {
      "Authorization":
          "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTk3MjY1NzAsInN1YiI6Mn0.rbdHsS81VoSvAlSR7w-ZfMT5oPwyiVIXs4hz_MGUzHk"
    }).then((http.Response response) {
      print("fgn");
      setState(() {
        List list = json.decode(response.body);
        items = list
            .asMap()
            .map((i, model) => MapEntry(i, _DoseItem.fromJson(model, i)))
            .values
            .toList();
        totalCards = items.length;
      });
      for (int i = 0; i < totalCards; i++) {
        setState(() {
          _expanded.add(false);
        });
      }
    }).catchError((error) {
      print(error);
    });
  }

  @override
  initState() {
    super.initState();

    _getUsers();
    print(items);
  }

  void notifyParent(index, state) {
    if (state == true) {
      setState(() {
        countOfTrue++;
      });
    } else {
      setState(() {
        countOfTrue--;
      });
    }
    if (countOfTrue == 0) {
      setState(() {
        _extended = false;
      });
    } else {
      setState(() {
        _extended = true;
      });
    }
  }

  void setExpandedTrue(index) {
    setState(() {
      _expanded[index] = true;
    });
  }

  void setExpandedFalse(index) {
    setState(() {
      _expanded[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: GestureDetector(
                onTap: () => {print(items)},
                child: Text(
                  'My Doses',
                  style: TextStyle(
                      color: const Color(0xff494949),
                      fontSize: 38,
                      fontWeight: FontWeight.w700),
                ),
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset('assets/LogoOnly.png', height: 20),
                      Text(
                        'On Time',
                        style: TextStyle(
                            color: const Color(0xff494949),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/LogoOnly.png', height: 20),
                      Text(
                        'Late',
                        style: TextStyle(
                            color: const Color(0xff494949),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/LogoOnly.png', height: 20),
                      Text(
                        'Missed',
                        style: TextStyle(
                            color: const Color(0xff494949),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              )),
          Expanded(child: _buildList(context, Axis.vertical))
        ],
      )),
    );
  }

  Widget _buildList(BuildContext context, Axis direction) {
    return ListView.builder(
      scrollDirection: direction,
      itemBuilder: (context, index) {
        return VerticalListItem(items[index], notifyParent, totalCards,
            _expanded, setExpandedTrue, setExpandedFalse, _getUsers);
      },
      itemCount: items.length,
    );
  }

  // Widget _getSlidableWithDelegates(
  //     BuildContext context, int index, Axis direction) {
  //   final _DoseItem item = items[index];

  //   return Slidable.builder(
  //     key: Key(item.index.toString()),
  //     controller: slidableController,
  //     direction: direction,
  //     dismissal: SlidableDismissal(
  //       child: SizedBox(
  //         height: 100,
  //       ),
  //       onDismissed: (actionType) {
  //         _showSnackBar(context, 'ho gya');
  //       },
  //     ),
  //     actionPane: SlidableBehindActionPane(),
  //     actionExtentRatio: 0.15,
  //     child: VerticalListItem(items[index], notifyParent, totalCards, _expanded,
  //         setExpandedTrue, setExpandedFalse),
  //     secondaryActionDelegate: _extended
  //         ? SlideActionBuilderDelegate(actionCount: 0)
  //         : SlideActionBuilderDelegate(
  //             actionCount: 3,
  //             builder: (context, index, animation, renderingMode) {
  //               if (index == 0) {
  //                 return Container(
  //                     padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
  //                     decoration: BoxDecoration(
  //                       borderRadius:
  //                           new BorderRadius.all(new Radius.circular(4.0)),
  //                     ),
  //                     child: IconSlideAction(
  //                       color: renderingMode == SlidableRenderingMode.slide
  //                           ? Color(0xff3bac30).withOpacity(animation.value)
  //                           : Color(0xff3bac30),
  //                       iconWidget: Text(
  //                         'Taken',
  //                         style: TextStyle(
  //                           fontSize: 15.0,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       onTap: () => _showSnackBar(context, 'Taken'),
  //                       closeOnTap: false,
  //                     ));
  //               } else if (index == 1) {
  //                 return Container(
  //                     padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
  //                     decoration: BoxDecoration(
  //                       borderRadius:
  //                           new BorderRadius.all(new Radius.circular(4.0)),
  //                     ),
  //                     child: IconSlideAction(
  //                       color: renderingMode == SlidableRenderingMode.slide
  //                           ? Color(0xfff8bc45).withOpacity(animation.value)
  //                           : Color(0xfff8bc45),
  //                       iconWidget: Text(
  //                         'Late',
  //                         style: TextStyle(
  //                           fontSize: 15.0,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       onTap: () => _showSnackBar(context, 'Late'),
  //                       closeOnTap: false,
  //                     ));
  //               } else {
  //                 return Container(
  //                     padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
  //                     decoration: BoxDecoration(
  //                       borderRadius:
  //                           new BorderRadius.all(new Radius.circular(4.0)),
  //                     ),
  //                     child: IconSlideAction(
  //                       color: renderingMode == SlidableRenderingMode.slide
  //                           ? Color(0xffff8c8c).withOpacity(animation.value)
  //                           : Color(0xffff8c8c),
  //                       iconWidget: Text(
  //                         'Missed',
  //                         style: TextStyle(
  //                           fontSize: 15.0,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       onTap: () => _showSnackBar(context, 'Missed'),
  //                       closeOnTap: false,
  //                     ));
  //               }
  //             }),
  //   );
  // }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

class VerticalListItem extends StatefulWidget {
  final _DoseItem item;
  Function notifyParent;
  int totalCards;
  Function setExpandedTrue;
  Function setExpandedFalse;
  Function _getUsers;
  List<bool> _expanded = List<bool>();

  VerticalListItem(
      this.item,
      this.notifyParent,
      this.totalCards,
      this._expanded,
      this.setExpandedTrue,
      this.setExpandedFalse,
      this._getUsers);
  @override
  State<StatefulWidget> createState() {
    return _VerticalListItem();
  }
}

class _VerticalListItem extends State<VerticalListItem> {
  _DoseItem item;

  _medicineFetcher(String medDos, String medDet, String medExp) {
    List<String> listDet = new List<String>();
    List<String> listExp = new List<String>();
    List<String> listDos = new List<String>();

    listDet = medDet.split("#");
    listExp = medExp.split("#");
    listDos = medDos.split("#");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: listDet
          .asMap()
          .map((i, element) => MapEntry(
                i,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            listDos[i],
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          Text(element, style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Text(listExp[i], style: TextStyle(fontSize: 18))
                    ]),
              ))
          .values
          .toList(),
    );
  }

  double height = 0.0;
  @override
  Widget build(BuildContext context) {
    var tempStatus;
    return GestureDetector(
        onTap: () => {
              tempStatus = widget._expanded[widget.item.index],
              widget.notifyParent(widget.item.index, tempStatus),
              setState(() {
                // height == 0.0 ? height = 180.0 : height = 0.0;
                widget._expanded[widget.item.index]
                    ? widget.setExpandedFalse(widget.item.index)
                    : widget.setExpandedTrue(widget.item.index);
              }),
              print(height),
            },
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          padding: EdgeInsets.fromLTRB(15, 15, 2, 15),
          decoration: BoxDecoration(
              color: (widget.item.index % 2 == 0
                  ? Color(0x445CC7D8)
                  : Color(0x44EC4D62)),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
              boxShadow: [
                CustomBoxShadow(
                    color: const Color(0xff494949),
                    offset: Offset(0.0, 0.0),
                    blurRadius: 2.0,
                    blurStyle: BlurStyle.outer),
              ]),
          child: Stack(children: <Widget>[
            Container(
              padding: widget._expanded[widget.item.index]
                  ? EdgeInsets.only(right: 25)
                  : EdgeInsets.only(right: 5),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: 92,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 2, color: Colors.black))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.item.day,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Text(
                                  widget.item.time,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(12, 10, 10, 10),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    widget.item.date,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    widget.item.foodDirection,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Container(
                        child: widget._expanded[widget.item.index]
                            ? Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                                child: Icon(
                                  CaredoseIcons.morning,
                                  size: 30,
                                ))
                            : ButtonTheme(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 20),
                                child: RaisedButton(
                                  color: widget.item.adherenceStatus ==
                                          "On Time"
                                      ? Colors.green
                                      : widget.item.adherenceStatus == "Late"
                                          ? Colors.yellow
                                          : Colors.red,
                                  child: Text(widget.item.adherenceStatus,
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () => {},
                                )),
                      )
                    ],
                  ),
                  Container(
                      height: widget._expanded[widget.item.index]
                          ? height = 180.0
                          : height = 0.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              height: 130,
                              child: _medicineFetcher(
                                  widget.item.medicinesDosage,
                                  widget.item.medicinesDetail,
                                  widget.item.medicinesExpiry)),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ButtonTheme(
                                    // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                                    child: RaisedButton(
                                  color: Colors.green,
                                  child: Text('On Time',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () => {
                                        http
                                            .post(
                                                'http://192.168.86.73:3000/api/doses/' +
                                                    widget.item.id.toString() +
                                                    '/mark_taken.json',
                                                body: "status:on_time")
                                            .then((http.Response response) {
                                          widget._getUsers();
                                          //     Map temp = json.decode(response.body);
                                          print("fbdfdbdfbdfb");
                                        }).catchError((error) {
                                          print(error);
                                        })
                                      },
                                )),
                                ButtonTheme(
                                    // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                                    child: RaisedButton(
                                  color: Colors.yellow,
                                  child: Text('Late',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () => {},
                                )),
                                ButtonTheme(
                                    // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                                    child: RaisedButton(
                                  color: Colors.red,
                                  child: Text('Missed',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () => {},
                                ))
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            widget._expanded[widget.item.index]
                ? Positioned(
                    right: 0,
                    child: Card(
                        color: Color(0x00ffffff),
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: height + 46,
                            width: 20,
                            color: widget.item.adherenceStatus == "On Time"
                                ? Colors.green
                                : widget.item.adherenceStatus == "Late"
                                    ? Colors.yellow
                                    : Colors.red,
                          ),
                        )))
                : Container(),
          ]),
        ));
  }
}
