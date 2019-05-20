import 'dart:io';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<File> _imageFile = [];

  _addImage(image) {
    setState(() {
      _imageFile.add(image);
    });
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  _removeImage(image) {
    setState(() {
      _imageFile.remove(image);
    });
  }

  final _Heading = Container(
    child:Text(
      'My Adherence',
      style:(TextStyle(
        color: const Color(0xff5a5a5a),
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ))
    ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backGround.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _Heading,



              ],
            ),
          ),
        ),
      ),
    );
  }
}
