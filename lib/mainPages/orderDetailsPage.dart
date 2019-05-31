import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Components/customShadow.dart';
import '../Components/CDOpacityContainer.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderDetailPage();
  }
}

class _OrderDetailPage extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Column(children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Order #',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 38,
                        ),
                      ),
                      Text(
                        '9999',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 38,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                        color: const Color(0x445CC7D8),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(7.0)),
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Image.asset(
                            'assets/Stepper-3.png',
                            width: 290,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Row(
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
                                    '28th April',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff494949)),
                                  ),
                                ],
                              )
                            ],
                          ),
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
                                    '9999-4',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff494949)),
                                  ),
                                  Text(
                                    "1st May '19",
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
                                'Call for Assistance',
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
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        'Carefills',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 38,
                        ),
                      )),
                ],
              )),
              Expanded(
                  child: ListView(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Stack(children: <Widget>[
                        CDOpacityContainer(
                            Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '1st Oct 2018',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '31st Jan 2019',
                                            style: TextStyle(
                                              fontSize: 13,
                                              // color: Color(0xff00ff00),
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Complete',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Adherence',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '98%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Text(
                                      '#9999-1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))),
                              ],
                            ),
                            0x445CC7D8,
                            CardType.orderDetail),
                        Positioned(
                            top: 10,
                            right: 5,
                            child: Image.asset('assets/info.png', height: 20))
                      ])),
                  Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Stack(children: <Widget>[
                        CDOpacityContainer(
                            Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '1st Oct 2018',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '31st Jan 2019',
                                            style: TextStyle(
                                              fontSize: 13,
                                              // color: Color(0xff00ff00),
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Complete',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Adherence',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '98%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Text(
                                      '#9999-1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))),
                              ],
                            ),
                            0x445CC7D8,
                            CardType.orderDetail),
                        Positioned(
                            top: 10,
                            right: 5,
                            child: Image.asset('assets/info.png', height: 20))
                      ])),
                  Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Stack(children: <Widget>[
                        CDOpacityContainer(
                            Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '1st Oct 2018',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '31st Jan 2019',
                                            style: TextStyle(
                                              fontSize: 13,
                                              // color: Color(0xff00ff00),
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Complete',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Adherence',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '98%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Text(
                                      '#9999-1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))),
                              ],
                            ),
                            0x445CC7D8,
                            CardType.orderDetail),
                        Positioned(
                            top: 10,
                            right: 5,
                            child: Image.asset('assets/info.png', height: 20))
                      ])),
                  Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Stack(children: <Widget>[
                        CDOpacityContainer(
                            Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '1st Oct 2018',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '31st Jan 2019',
                                            style: TextStyle(
                                              fontSize: 13,
                                              // color: Color(0xff00ff00),
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Complete',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Adherence',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '98%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Text(
                                      '#9999-1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))),
                              ],
                            ),
                            0x445CC7D8,
                            CardType.orderDetail),
                        Positioned(
                            top: 10,
                            right: 5,
                            child: Image.asset('assets/info.png', height: 20))
                      ])),
                  Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Stack(children: <Widget>[
                        CDOpacityContainer(
                            Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '1st Oct 2018',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '31st Jan 2019',
                                            style: TextStyle(
                                              fontSize: 13,
                                              // color: Color(0xff00ff00),
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Complete',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Adherence',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '98%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Text(
                                      '#9999-1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))),
                              ],
                            ),
                            0x445CC7D8,
                            CardType.orderDetail),
                        Positioned(
                            top: 10,
                            right: 5,
                            child: Image.asset('assets/info.png', height: 20))
                      ])),
                  Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Stack(children: <Widget>[
                        CDOpacityContainer(
                            Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '1st Oct 2018',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '31st Jan 2019',
                                            style: TextStyle(
                                              fontSize: 13,
                                              // color: Color(0xff00ff00),
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Complete',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Adherence',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '98%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Text(
                                      '#9999-1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))),
                              ],
                            ),
                            0x445CC7D8,
                            CardType.orderDetail),
                        Positioned(
                            top: 10,
                            right: 5,
                            child: Image.asset('assets/info.png', height: 20))
                      ])),
                ],
              ))
            ],
          )),
        ]));
  }
}
