import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';


import './mainPages/testingCharts.dart';
import './mainPages/chartsOtherTest.dart';
import './signup.dart';
import './signin.dart';
import './adherence.dart';

// import 'dart:math';
void main() {
  // debugPaintSizeEnabled = true;
  SystemChrome.setEnabledSystemUIOverlays([]);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<int> _data = [];
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner : false,
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: SafeArea(child: MyHomePage())));
  }
}
