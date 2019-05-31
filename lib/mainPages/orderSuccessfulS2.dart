import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Components/customShadow.dart';

class orderSuccessful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _orderSuccessful();
  }
}

class _orderSuccessful extends State<orderSuccessful> {
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
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                          child:
                              Image.asset('assets/LogoOnly.png', height: 200),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: Text(
                            'Payment Successful!',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff494949),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text(
                            'Your refill will by delivered by',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff494949),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Text(
                            '30th May 2019',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff494949),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        ButtonTheme(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                          child: RaisedButton(
                            color: Colors.blueAccent,
                            child: Text('Done',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => {},
                          ),
                        ),
                      ]))),
        ]));
  }
}
