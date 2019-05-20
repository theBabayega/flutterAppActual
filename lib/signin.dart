import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignIn();
  }
}

class _SignIn extends State<SignIn> {
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: TextField(
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            contentPadding: const EdgeInsets.all(0),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffEC4D62),
                                    width: 3.0)),
                            labelStyle: TextStyle(
                                color: const Color(0xff5a5a5a),
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            labelText: 'Password',
                            contentPadding: const EdgeInsets.all(0),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffEC4D62),
                                    width: 3.0)),
                            labelStyle: TextStyle(
                                color: const Color(0xff5a5a5a),
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child:ButtonTheme(
                        minWidth: double.infinity,
                        child: RaisedButton(
                          color: const Color(0xff5CC7D8),
                          child: const Text('Sign In'),
                          onPressed: () => {},
                        )),)
                  ],
                )),
          ),
          Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have a login ID? Click here to ",
                          style: TextStyle(
                            color: const Color(0xff5a5a5a),
                            fontSize: 15,
                            fontFamily: 'roboto',
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text('Sign Up',
                            style: TextStyle(
                              color: const Color(0xff5a5a5a),
                              fontSize: 15,
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.w700,
                            )),
                      )
                    ],
                  ))),
              Container(
                child: ButtonTheme(
                    child: RaisedButton(
                  color: const Color(0xff5CC7D8),
                  child: const Text('Sign Up'),
                  onPressed: () => {},
                )),
              ),
            ],
          ),
        ])));
  }
}
