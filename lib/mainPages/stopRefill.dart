import 'package:cdapp/Components/CDOpacityContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Components/customShadow.dart';

class StopRefill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StopRefill();
  }
}

class _StopRefill extends State<StopRefill> {
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
                  'Stop Refill',
                  style: TextStyle(
                    color: const Color(0xff494949),
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: Text(
                    'Reason for Stopping?',
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
                  ButtonTheme(
                      child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('No',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                        Text(', stop my CAREDOSE*',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18))
                      ],
                    ),
                    onPressed: () => {},
                  )),
                  Text(
                      '*this will discontinue the CAREDOSE service and cancel your order.',
                      style: TextStyle(
                          color: Color(0xff494949),
                          fontWeight: FontWeight.w600,
                          fontSize: 10)),
                  Text(
                      'Should you wish to start again, please contact us at +919611343341',
                      style: TextStyle(
                          color: Color(0xff494949),
                          fontWeight: FontWeight.w600,
                          fontSize: 10)),
                ],
              ),
            )
          ],
        ));
  }
}
