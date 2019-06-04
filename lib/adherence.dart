import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import './caredose_icons_icons.dart';

import './Components/customShadow.dart';

enum PronterProfileEnum {
  MorningEnglish,
  AfternoonEnglish,
  EveningEnglish,
  NightEnglish
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _DoseItem {
  const _DoseItem(
      this.index,
      this.time,
      this.day,
      this.adherenceStatus,
      this.printerProfile,
      this.date,
      this.foodDirection,
      this.medicinesDosage,
      this.medicinesDetail,
      this.medicinesExpiry);

  final int index;
  final String date;
  final String foodDirection;
  final List<String> medicinesDosage;
  final List<String> medicinesDetail;
  final List<String> medicinesExpiry;
  final String time;
  final String day;
  final String adherenceStatus;
  final PronterProfileEnum printerProfile;
}

class _MyHomePageState extends State<MyHomePage> {
  bool _extended = false;
  int totalCards = 20;
  SlidableController slidableController;

  void notifyParent(index, state) {
    if (state == true) {
      print('$index lololo');
      // setState(() {
      //   _extended = false;
      // });
    } else {
      // setState(() {
      //   _extended = true;
      // });
    }
  }

  final List<_DoseItem> items = List.generate(
    20,
    (i) => _DoseItem(
          i,
          "09:00 AM",
          "Friday",
          "On Time",
          PronterProfileEnum.EveningEnglish,
          '2019-12-01',
          "After Food",
          [
            '1 Tab',
            '1 Tab',
            '1 Tab',
            '1 Tab',
            '1 Tab',
            '1 Tab',
          ],
          [
            'Crocin Cold N Flue1 ',
            'Crocin Cold N Flue 2',
            'Crocin Cold N Flue3 ',
            'Crocin Cold N Flue4 ',
            'Crocin Cold N Flue5 ',
            'Crocin Cold N Flue6 ',
          ],
          [
            '03/20',
            '03/20',
            '03/20',
            '03/20',
            '03/20',
            '03/20',
          ],
        ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_extended.toString()),
      ),
      body: Center(child: _buildList(context, Axis.vertical)),
    );
  }

  Widget _buildList(BuildContext context, Axis direction) {
    return ListView.builder(
      scrollDirection: direction,
      itemBuilder: (context, index) {
        return _getSlidableWithDelegates(context, index, Axis.horizontal);
      },
      itemCount: items.length,
    );
  }

  Widget _getSlidableWithDelegates(
      BuildContext context, int index, Axis direction) {
    final _DoseItem item = items[index];

    return Slidable.builder(
      key: Key(item.index.toString()),
      controller: slidableController,
      direction: direction,
      dismissal: SlidableDismissal(
        child: SizedBox(
          height: 100,
        ),
        onDismissed: (actionType) {
          _showSnackBar(context, 'ho gya');
        },
      ),
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.15,
      child: VerticalListItem(items[index], notifyParent, totalCards),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 3,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(4.0)),
                  ),
                  child: IconSlideAction(
                    color: renderingMode == SlidableRenderingMode.slide
                        ? Color(0xff3bac30).withOpacity(animation.value)
                        : Color(0xff3bac30),
                    iconWidget: Text(
                      'Taken',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => _showSnackBar(context, 'Taken'),
                    closeOnTap: false,
                  ));
            } else if (index == 1) {
              return Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(4.0)),
                  ),
                  child: IconSlideAction(
                    color: renderingMode == SlidableRenderingMode.slide
                        ? Color(0xfff8bc45).withOpacity(animation.value)
                        : Color(0xfff8bc45),
                    iconWidget: Text(
                      'Late',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => _showSnackBar(context, 'Late'),
                    closeOnTap: false,
                  ));
            } else {
              return Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(4.0)),
                  ),
                  child: IconSlideAction(
                    color: renderingMode == SlidableRenderingMode.slide
                        ? Color(0xffff8c8c).withOpacity(animation.value)
                        : Color(0xffff8c8c),
                    iconWidget: Text(
                      'Missed',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => _showSnackBar(context, 'Missed'),
                    closeOnTap: false,
                  ));
            }
          }),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

class VerticalListItem extends StatefulWidget {
  final _DoseItem item;
  Function notifyParent;
  int totalCards;

  VerticalListItem(this.item, this.notifyParent, this.totalCards);
  @override
  State<StatefulWidget> createState() {
    return _VerticalListItem();
  }
}

class _VerticalListItem extends State<VerticalListItem> {
  List<bool> _expanded = List<bool>();
  _DoseItem item;
  @override
  initState() {
    super.initState();
    for (int i = 0; i < widget.totalCards; i++) {
      _expanded.add(false);
    }
  }

  _checkStateExpansion(index) {
    print('$index ');
    if (_expanded == false) {
      setState(() {
        _expanded[index] = true;
      });
      widget.notifyParent(index, true);
    } else {
      setState(() {
        _expanded[index] = false;
      });
      widget.notifyParent(index, false);
    }
  }

  _medicineFetcher(
      List<String> medDos, List<String> medDet, List<String> medExp) {
    List<Widget> listDet = new List<Widget>();
    List<Widget> listExp = new List<Widget>();
    for (var i = 0; i < medDet.length; i++) {
      listDet.add(new Text(medDet[i]));
      listExp.add(new Text(medExp[i]));
      listExp.add(new Text(medDos[i]));
    }
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    medDos[0],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(medDet[0], style: TextStyle(fontSize: 18)),
                ],
              ),
              Text(medExp[0], style: TextStyle(fontSize: 18))
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    medDos[0],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(medDet[0], style: TextStyle(fontSize: 18)),
                ],
              ),
              Text(medExp[0], style: TextStyle(fontSize: 18))
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    medDos[0],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(medDet[0], style: TextStyle(fontSize: 18)),
                ],
              ),
              Text(medExp[0], style: TextStyle(fontSize: 18))
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    medDos[0],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(medDet[0], style: TextStyle(fontSize: 18)),
                ],
              ),
              Text(medExp[0], style: TextStyle(fontSize: 18))
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    medDos[0],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(medDet[0], style: TextStyle(fontSize: 18)),
                ],
              ),
              Text(medExp[0], style: TextStyle(fontSize: 18))
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    medDos[0],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(medDet[0], style: TextStyle(fontSize: 18)),
                ],
              ),
              Text(medExp[0], style: TextStyle(fontSize: 18))
            ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _checkStateExpansion(widget.item.index),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            color: const Color(0x445CC7D8),
            borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
            boxShadow: [
              CustomBoxShadow(
                  color: const Color(0xff494949),
                  offset: Offset(0.0, 0.0),
                  blurRadius: 2.0,
                  blurStyle: BlurStyle.outer),
            ]),
        child: ExpansionTile(
          key: Key(widget.item.index.toString()),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 2, color: Colors.black))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.item.day,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Text(
                      widget.item.time,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.item.date,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      Text(
                        widget.item.foodDirection,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ],
                  )),
            ],
          ),
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: _medicineFetcher(widget.item.medicinesDosage,
                    widget.item.medicinesDetail, widget.item.medicinesExpiry)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                      // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: RaisedButton(
                    color: Colors.green,
                    child:
                        Text('On Time', style: TextStyle(color: Colors.white)),
                    onPressed: () => {},
                  )),
                  ButtonTheme(
                      // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: RaisedButton(
                    color: Colors.yellow,
                    child: Text('Late', style: TextStyle(color: Colors.white)),
                    onPressed: () => {},
                  )),
                  ButtonTheme(
                      // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: RaisedButton(
                    color: Colors.red,
                    child:
                        Text('Missed', style: TextStyle(color: Colors.white)),
                    onPressed: () => {},
                  ))
                ],
              ),
            )
          ],
          trailing: _expanded[widget.item.index]
              ? ButtonTheme(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: RaisedButton(
                    color: Colors.green,
                    child:
                        Text('On Time', style: TextStyle(color: Colors.white)),
                    onPressed: () => {},
                  ))
              : Icon(
                  CaredoseIcons.morning,
                  size: 30,
                ),
        ),
      ),
    );
  }
}
