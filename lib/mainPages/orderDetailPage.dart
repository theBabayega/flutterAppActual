import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Components/customShadow.dart';

class MyOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyOrders();
  }
}

class _MyOrders extends State<MyOrders> {
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
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Order',
                  style: TextStyle(
                    color: const Color(0xff494949),
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                  ),
                ),
                Text(
                  'Order',
                  style: TextStyle(
                    color: const Color(0xff494949),
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                  ),
                ),
              ],
            )),
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
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
                          height: 100,
                          decoration: BoxDecoration(
                              color: const Color(0x445CC7D8),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(7.0)),
                              boxShadow: [
                                CustomBoxShadow(
                                    // color: const Color(0xff494949),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          child: Image.asset(
                                              'assets/LogoOnly.png',
                                              height: 60)))),
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
                                          MainAxisAlignment.spaceAround,
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
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
                          height: 100,
                          decoration: BoxDecoration(
                              color: const Color(0x22EC4D62),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(7.0)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          '2nd Dec 2018',
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
                                      decoration: BoxDecoration(
                                          // color: const Color(0xff909090),
                                          border: Border(
                                              right: BorderSide(
                                        color: const Color(0xfff3898a),
                                        width: 1,
                                      ))),
                                      child: Container(
                                          child: Image.asset(
                                              'assets/LogoOnly.png',
                                              height: 60)))),
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
                                          MainAxisAlignment.spaceAround,
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
                                    '#9998',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
