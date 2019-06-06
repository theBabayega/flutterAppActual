import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../Components/customShadow.dart';

class MyOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyOrders();
  }
}

class Carefills {
  int id;
  String orderIdentifier;
  int orderID;
  String deliveryDate;
  String status;
  String startDate;
  String endDate;
  String packagingDate;
  String nextStartDate;
  int userID;
  int adherence;

  Carefills({
    this.id,
    this.orderIdentifier,
    this.orderID,
    this.deliveryDate,
    this.status,
    this.startDate,
    this.endDate,
    this.packagingDate,
    this.nextStartDate,
    this.userID,
    this.adherence,
  });
  factory Carefills.fromJson(Map<String, dynamic> json) {
    return Carefills(
      id: json['id'],
      orderIdentifier: json['order_identifier'],
      orderID: json['order_id'],
      deliveryDate: json['delivery_date'],
      status: json['status'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      packagingDate: json['packaging_date'],
      nextStartDate: json['next_start_date'],
      userID: json['user_id'],
      adherence: json['adherence'],
    );
  }
}

class PendingCarefill {
  int carefillStatus;
  int id;
  String startDate;

  PendingCarefill({
    this.carefillStatus,
    this.id,
    this.startDate,
  });
  factory PendingCarefill.fromJson(Map<String, dynamic> json) {
    return PendingCarefill(
      carefillStatus: json['carefill_status'],
      id: json['id'],
      startDate: json['start_date'],
    );
  }
}

class DataOrders {
  List<Carefills> carefills;
  PendingCarefill pendingCarefill;

  DataOrders({
    this.carefills,
    this.pendingCarefill,
  });
  factory DataOrders.fromJson(Map<String, dynamic> json) {
    var list = json['carefills'] as List;
    print(list.runtimeType);
    List<Carefills> carefill =
        list.map((i) => Carefills.fromJson(i)).toList();
    // pendingCarefill = PendingCarefill.fromJson(json['pending_carefill']);

    return DataOrders(
      carefills: carefill,
      pendingCarefill: PendingCarefill.fromJson(json['pending_carefill']));
  }
}

class _MyOrders extends State<MyOrders> {
  DataOrders data;
  _getData() {
    var response = json.encode([
      {
        "carefills": [
          {
            "id": 3468,
            "order_identifier": "190 - 1",
            "order_id": 190,
            "delivery_date": "2019-03-08",
            "status": null,
            "start_date": "2019-02-28",
            "end_date": "2019-03-09",
            "packaging_date": "2019-03-07",
            "next_start_date": "2019-03-10",
            "user_id": 2,
            "adherence": 93
          },
          {
            "id": 3861,
            "order_identifier": "190 - 2",
            "order_id": 190,
            "delivery_date": "2019-06-29",
            "status": null,
            "start_date": "2019-06-01",
            "end_date": "2019-06-30",
            "packaging_date": "2019-06-28",
            "next_start_date": "2019-07-01",
            "user_id": 2,
            "adherence": 97
          },
          {
            "id": 3862,
            "order_identifier": "190 - 3",
            "order_id": 190,
            "delivery_date": "2019-07-29",
            "status": 1,
            "start_date": "2019-07-01",
            "end_date": "2019-07-30",
            "packaging_date": "2019-07-28",
            "next_start_date": "2019-07-31",
            "user_id": 2,
            "adherence": 0
          }
        ],
        "pending_carefill": {
          "carefill_status": 1,
          "id": 3862,
          "carefill_start_date": "2019-07-01"
        }
      }
    ]);

    //     setState(() {
    //     List list = json.decode(response);
    //     items = list
    //         .asMap()
    //         .map((i, model) => MapEntry(i, _DoseItem.fromJson(model, i)))
    //         .values
    //         .toList();
    //     totalCards = items.length;
    //   });

    print(response);
    setState(() {
      Map<String, dynamic> item = json.decode(response);
      // status = HomeStatus.fromJson(item);
      data = DataOrders.fromJson(item);
    });
  }
  initState() {
    super.initState();

    _getData();
    print(data);
  }

  getCardAllOrder() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
      padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
      height: 100,
      decoration: BoxDecoration(
          color: const Color(0x445CC7D8),
          borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
          boxShadow: [
            CustomBoxShadow(
                color: const Color(0xff494949),
                offset: Offset(0.0, 0.0),
                blurRadius: 2.0,
                blurStyle: BlurStyle.outer),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    // color: const Color(0xff909090),
                    border: Border(
                        right: BorderSide(
                  color: const Color(0xfff3898a),
                  width: 1,
                ))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '1st Oct 2018',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff00ff00),
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                      // color: const Color(0xff909090),
                      border: Border(
                          right: BorderSide(
                    color: const Color(0xfff3898a),
                    width: 1,
                  ))),
                  child: Container(
                      child: Image.asset('assets/LogoOnly.png', height: 60)))),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    // color: const Color(0xff909090),
                    border: Border(
                        right: BorderSide(
                  color: const Color(0xfff3898a),
                  width: 1,
                ))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      '4',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Carefills',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                  child: Text(
                '#9999',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                'Next Carefill',
                style: TextStyle(
                  color: const Color(0xff494949),
                  fontWeight: FontWeight.w700,
                  fontSize: 42,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              decoration: BoxDecoration(
                  color: const Color(0x445CC7D8),
                  borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                  boxShadow: [
                    CustomBoxShadow(
                        color: const Color(0xff494949),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/Stepper-3.png',
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Confirmed',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff494949)),
                      ),
                      Text(
                        'Processing',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff494949)),
                      ),
                      Text(
                        'Packaged',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff494949)),
                      ),
                      Text(
                        'Dispatched',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff494949)),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Delivery by',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff494949)),
                          ),
                          Text(
                            '28th April', // here
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff494949)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Carefill ID',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff494949)),
                            ),
                            Text(
                              'Start Date',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff494949)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '9999-4', // here
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff494949)),
                            ),
                            Text(
                              "1st May '19", // here
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff494949)),
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        child: Text(
                          'Call for Assistance', // here
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff494949)),
                        ),
                        color: Color(0xff44bb44),
                        onPressed: () => {},
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'All Orders',
                    style: TextStyle(
                      color: const Color(0xff494949),
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView(
                      children: <Widget>[getCardAllOrder()],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
