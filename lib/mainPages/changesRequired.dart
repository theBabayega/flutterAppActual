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
  List<bool> _reasonCheck = [true,false];

  _reasonToggle(int index) {
    if (_reasonCheck[index] == true) {
      _reasonCheck[index] = false;
      return Image.asset('assets/LogoOnly.png',height:20);
    } else {
      _reasonCheck[index] = true;
      return Opacity(
        opacity: 0,
        child: Image.asset('assets/LogoOnly.png',height:20),
      );
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
            Container(
              child: Expanded(
                child: CDOpacityContainer(
                  Row(
                    children: <Widget>[
                      Text('Reason 1'),
                      _reasonToggle(0)
                    ],
                  ),
                  0x22494949,
                  CardType.stopRefill
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Would you like us to call you?',
                    style: TextStyle(
                      color: const Color(0xff494949),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
                          height: 100,
                          decoration: BoxDecoration(
                              color: const Color(0x445CC7D8),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(7.0)),
                              boxShadow: [
                                CustomBoxShadow(
                                    color: const Color(0xff494949),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 2.0,
                                    blurStyle: BlurStyle.outer),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // color: const Color(0xff909090),
                                        border: Border(
                                            right: BorderSide(
                                      color: const Color(0xfff3898a),
                                      width: 1,
                                    ))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '1st Oct 2018',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          'Active',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff00ff00),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          // color: const Color(0xff909090),
                                          border: Border(
                                              right: BorderSide(
                                        color: const Color(0xfff3898a),
                                        width: 1,
                                      ))),
                                      child: Container(
                                          child: Image.asset(
                                              'assets/LogoOnly.png',
                                              height: 60)))),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // color: const Color(0xff909090),
                                        border: Border(
                                            right: BorderSide(
                                      color: const Color(0xfff3898a),
                                      width: 1,
                                    ))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          '4',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          'Carefills',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      child: Text(
                                    '#9999',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
                          height: 100,
                          decoration: BoxDecoration(
                              color: const Color(0x22EC4D62),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(7.0)),
                              boxShadow: [
                                CustomBoxShadow(
                                    color: const Color(0xff494949),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 2.0,
                                    blurStyle: BlurStyle.outer),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // color: const Color(0xff909090),
                                        border: Border(
                                            right: BorderSide(
                                      color: const Color(0xfff3898a),
                                      width: 1,
                                    ))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '1st Oct 2018',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          '2nd Dec 2018',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          // color: const Color(0xff909090),
                                          border: Border(
                                              right: BorderSide(
                                        color: const Color(0xfff3898a),
                                        width: 1,
                                      ))),
                                      child: Container(
                                          child: Image.asset(
                                              'assets/LogoOnly.png',
                                              height: 60)))),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // color: const Color(0xff909090),
                                        border: Border(
                                            right: BorderSide(
                                      color: const Color(0xfff3898a),
                                      width: 1,
                                    ))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          '4',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          'Carefills',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      child: Text(
                                    '#9998',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
