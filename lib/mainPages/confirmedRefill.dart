import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Components/customShadow.dart';

class confirmedRefill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _confirmedRefill();
  }
}

class _confirmedRefill extends State<confirmedRefill> {
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
                    Text(
                      'Confirm Refill',
                      style: TextStyle(
                        color: const Color(0xff494949),
                        fontWeight: FontWeight.w700,
                        fontSize: 38,
                      ),
                    ),
                  ],
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      width: double.infinity,
                      child: Image.asset('assets/LogoOnly.png', height: 75),
                    ),
                    Container(
                      child: Image.asset('assets/LogoOnly.png', height: 100),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 5),
                        child: Text(
                          'Your refill has been confirmed!',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          'and will be delivered by',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          '30th May 2019',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        )),
                    ButtonTheme(
                      minWidth: 200,
                      child: RaisedButton(
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text('Continue to Payment',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        onPressed: () => {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child:ButtonTheme(
                      minWidth: 200,
                      child: RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text('Cancel and start again',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        onPressed: () => {},
                      ),
                    ))
                  ],
                )
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text('Question?Request a callback',
                    style: TextStyle(color: Colors.white)),
                onPressed: () => {},
              )
            ],
          )
        ]));
  }
}
