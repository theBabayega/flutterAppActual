import 'package:cdapp/Components/CDOpacityContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Components/customShadow.dart';

class ChangesRequired extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangesRequired();
  }
}

class _ChangesRequired extends State<ChangesRequired> {
  List<bool> _reasonCheck = [false, false, false];

  _reasonValueChange(int index) {
    if (_reasonCheck[index] == true) {
      setState(() {
        _reasonCheck[index] = false;
      });
    } else {
      setState(() {
        _reasonCheck[index] = true;
      });
    }
  }

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
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Changes Required',
                  style: TextStyle(
                    color: const Color(0xff494949),
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: Text(
                    'What has changed?',
                    style: TextStyle(
                      color: const Color(0xff494949),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            )),
            GestureDetector(
                onTap: () {
                  _reasonValueChange(0);
                },
                child: CDOpacityContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              'Reason 1',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            child: _reasonCheck[0]
                                ? Image.asset('assets/LogoOnly.png', height: 40)
                                : SizedBox(
                                    height: 40,
                                  ))
                      ],
                    ),
                    0x22EC4D62,
                    CardType.stopRefill)),
            GestureDetector(
                onTap: () {
                  _reasonValueChange(1);
                },
                child: CDOpacityContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              'Reason 2',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            child: _reasonCheck[1]
                                ? Image.asset('assets/LogoOnly.png', height: 40)
                                : SizedBox(
                                    height: 40,
                                  ))
                      ],
                    ),
                    0x22EC4D62,
                    CardType.stopRefill)),
            GestureDetector(
              onTap: () {
                _reasonValueChange(2);
              },
              child: CDOpacityContainer(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'Reason 3',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                          child: _reasonCheck[2]
                              ? Image.asset('assets/LogoOnly.png', height: 40)
                              : SizedBox(
                                  height: 40,
                                ))
                    ],
                  ),
                  0x22EC4D62,
                  CardType.stopRefill),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Would you like us to call you?',
                        style: TextStyle(
                          color: const Color(0xff494949),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      )),
                  ButtonTheme(
                      child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Yes',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                        Text(', please call me',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18))
                      ],
                    ),
                    onPressed: () => {},
                  )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text('OR',
                          style: TextStyle(
                              color: Color(0xff494949),
                              fontWeight: FontWeight.w700,
                              fontSize: 24))),
                  ButtonTheme(
                      child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Call Us',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                      ],
                    ),
                    onPressed: () => {},
                  )),
                ],
              ),
            )
          ],
        ));
  }
}
