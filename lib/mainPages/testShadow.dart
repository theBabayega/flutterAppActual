import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class testShadow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _testShadow();
  }
}

class _testShadow extends State<testShadow> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/LogoOnly.png',
                      height: 240,

                    ),
                  ],
                )),
          ),
        ])));
  }
}
