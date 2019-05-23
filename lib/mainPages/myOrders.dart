import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './customShadow.dart';

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
              padding:EdgeInsets.fromLTRB(30,10,30,10 ),
              height: 100,
              decoration: BoxDecoration(
                  color: const Color(0x445CC7D8),
                  borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                  boxShadow: [
                    CustomBoxShadow(
                        color: const Color(0xff666666),
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
                  )
                ],
              ),
            )
          ],
        ));
  }
}
