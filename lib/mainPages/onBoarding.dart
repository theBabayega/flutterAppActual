import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnBoarding();
  }
}

class _OnBoarding extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 30.0, 0, 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/LogoOnly.png',
                      height: 120,
                    ),
                    Text(
                      'CAREDOSE',
                      style: TextStyle(
                          color: Colors.black.withOpacity(1.0),
                          fontSize: 40,
                          fontFamily: 'baskerville'),
                    ),
                    Text(
                      'YOUR MEDICATION SORTED',
                      style: TextStyle(
                          color: Colors.red.withOpacity(1.0),
                          fontSize: 10,
                          fontFamily: 'baskerville'),
                    ),
                    Container(child: Image.asset('assets/bg.png', height: 120)),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                            "We've received your information, our team will contact you soon!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff576164),
                              fontSize: 32,
                            )))
                  ],
                )),
          ),
          Container(
            padding:EdgeInsets.fromLTRB(14,0,0,0),
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Text("Need Help? Call Us! ",
                          style: TextStyle(
                            color: const Color(0xff5a5a5a),
                            fontSize: 15,
                            fontFamily: 'roboto',
                          )),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: ButtonTheme(
                    child: RaisedButton(
                  color: const Color(0xff5CC7D8),
                  child: const Text('Call',
                      style: TextStyle(color: const Color(0xffffffff))),
                  onPressed: () => {},
                )),
              ),
            ],
          ),),
        ])));
  }
}
