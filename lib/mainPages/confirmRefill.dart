import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './customShadow.dart';

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
                      child: Image.asset('assets/LogoOnly.png', height: 100),
                    ),
                    Container(
                      child: Image.asset('assets/LogoOnly.png', height: 150),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
                        child: Text(
                          'Your refill has been confirmed!',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        )),
                    ButtonTheme(
                      minWidth: double.infinity,
                      child: RaisedButton(
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text('Continue to Payment',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                        onPressed: () => {},
                      ),
                    )
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
