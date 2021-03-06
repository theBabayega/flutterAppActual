import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

// import './mainPages/testingCharts.dart';
// import './mainPages/myAdherencePage.dart';
// import './signup.dart';
// import './signin.dart';
// import './adherence.dart';
// import './mainPages/myDoses.dart';
// import './mainPages/myOrders.dart';
// import './mainPages/testShadow.dart';
// import './mainPages/onBoarding.dart';
// import './mainPages/orderDetailsPage.dart';
// import './mainPages/confirmRefill.dart';
// import './mainPages/confirmedRefill.dart';
// import './mainPages/paymentSuccessful.dart';
// import './mainPages/changesRequired.dart';
// import './mainPages/orderSuccessfulS2.dart';
// import './mainPages/stopRefill.dart';
// import './mainPages/homePage.dart';
// import './mainPages/myDosesSimple.dart';
import './Components/loader.dart';


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
            body: SafeArea(child: Loader(50))));
  }
}
