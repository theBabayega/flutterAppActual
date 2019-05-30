import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../Components/customShadow.dart';
import '../Components/CDOpacityContainer.dart';

class confirmRefill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _confirmRefill();
  }
}

class _confirmRefill extends State<confirmRefill> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'Confirm Refill',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child:Row(
                      children: <Widget>[
                        Container(
                          margin:EdgeInsets.only(right: 18),
                          child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Start Date ',
                              style: TextStyle(
                                color: const Color(0xff494949),
                                fontWeight: FontWeight.w900,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              'Duration',
                              style: TextStyle(
                                color: const Color(0xff494949),
                                fontWeight: FontWeight.w900,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '2nd June 2019',
                              style: TextStyle(
                                color: const Color(0xff494949),
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              '30 Days',
                              style: TextStyle(
                                color: const Color(0xff494949),
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                      child: Text(
                        'Upcoming Medicines',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    CDOpacityContainer(
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '1 Tab ',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Crocin Cold N Flu',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 19,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'till 2/7/19',
                                    style: TextStyle(
                                      color: const Color(0xff494949),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Twice a day,',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'every day',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '60',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        ' tabs',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        0x1fEC4D62,
                        CardType.confirmRefill),
                    CDOpacityContainer(
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '1 Tab ',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Crocin Cold N Flu',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 19,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'till 2/7/19',
                                    style: TextStyle(
                                      color: const Color(0xff494949),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Twice a day,',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'every day',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '60',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        ' tabs',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        0x1fEC4D62,
                        CardType.confirmRefill),
                    CDOpacityContainer(
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '1 Tab ',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Crocin Cold N Flu',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 19,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'till 2/7/19',
                                    style: TextStyle(
                                      color: const Color(0xff494949),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Twice a day,',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'every day',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '60',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        ' tabs',
                                        style: TextStyle(
                                          color: const Color(0xff494949),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        0x1fEC4D62,
                        CardType.confirmRefill),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        'Is everything in order?',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: RaisedButton(
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Yes,',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'confirm refill',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ),
                    ButtonTheme(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      minWidth: double.infinity,
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'No,',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'something has changed',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        onPressed: () => {},
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Divider(
                        color: Colors.black,
                        height: 32,
                      ),
                    )
                  ],
                )),
              ])),
          ButtonTheme(
              padding: EdgeInsets.symmetric(vertical: 15),
              minWidth: double.infinity,
              child: RaisedButton(
                color: Colors.red,
                child:
                    Text('STOP Refill', style: TextStyle(color: Colors.white)),
                onPressed: () => {},
              )),
        ]));
  }
}
