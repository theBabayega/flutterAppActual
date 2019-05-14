import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './signup.dart';
import './signin.dart';


// import 'dart:math';
void main() {
  // debugPaintSizeEnabled = true;
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomPadding:false,
            body: SafeArea(
                child: SignIn() )));
  }
}
