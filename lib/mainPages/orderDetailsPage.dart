import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './customShadow.dart';

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
                Text(
                  'Carefills',
                  style: TextStyle(
                    color: const Color(0xff494949),
                    fontWeight: FontWeight.w700,
                    fontSize: 38,
                  ),
                ),
              ],
            )),
            Stack(children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
                height: 100,
                decoration: BoxDecoration(
                    color: const Color(0x225CC7D8),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(7.0)),
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              Positioned(
                top:10,
                right:5,
                child:Image.asset('assets/info.png',height:20)
              )
            ]),
            Container(
              margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
              padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
              height: 100,
              decoration: BoxDecoration(
                  color: const Color(0x22EC4D62),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
              padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
              height: 100,
              decoration: BoxDecoration(
                  color: const Color(0x225CC7D8),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ],
        ));
  }
}
