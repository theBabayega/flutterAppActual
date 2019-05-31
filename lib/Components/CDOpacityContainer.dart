import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Components/customShadow.dart';

enum CardType {
  confirmRefill,
  payment,
  orderDetail,
  stopRefill,
}

class CDOpacityContainer extends StatelessWidget {
  final Widget _child;
  final int _color;
  final CardType _cardType;

  dynamic paddingValues(CardType cardType) {
    if (cardType == CardType.confirmRefill) {
      return EdgeInsets.fromLTRB(0, 0, 0, 0);
    } else if (cardType == CardType.orderDetail) {
      return EdgeInsets.fromLTRB(0, 20, 0, 20);
    } else if (cardType == CardType.payment) {
      return EdgeInsets.fromLTRB(0, 6, 0, 6);
    } else if (cardType == CardType.stopRefill) {
      return EdgeInsets.fromLTRB(0, 6, 0, 6);
    }
    return EdgeInsets.fromLTRB(0, 6, 0, 60);
  }

  dynamic marginValues(CardType cardType) {
    if (cardType == CardType.confirmRefill) {
      return EdgeInsets.fromLTRB(0, 3, 0, 3);
    } else if (cardType == CardType.orderDetail) {
      return EdgeInsets.fromLTRB(0, 6, 0, 6);
    } else if (cardType == CardType.payment) {
      return EdgeInsets.fromLTRB(0, 6, 0, 6);
    } else if (cardType == CardType.stopRefill) {
      return EdgeInsets.fromLTRB(0, 6, 0, 6);
    }
    return EdgeInsets.fromLTRB(0, 6, 0, 6);
  }

  double heightValue(CardType cardType) {
    if (cardType == CardType.confirmRefill) {
      return 58;
    } else if (cardType == CardType.orderDetail) {
      return 100;
    } else if (cardType == CardType.payment) {
      return 400;
    } else if (cardType == CardType.stopRefill) {
      return 100;
    }
    return 0;
  }

  double borderRadius(CardType cardType) {
    if (cardType == CardType.confirmRefill) {
      return 4.0;
    } else if (cardType == CardType.orderDetail) {
      return 7.0;
    } else if (cardType == CardType.payment) {
      return 7.0;
    } else if (cardType == CardType.stopRefill) {
      return 7.0;
    }
    return 0;
  }

  CDOpacityContainer(this._child, this._color, this._cardType);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: marginValues(_cardType),
        padding: paddingValues(_cardType),
        height: heightValue(_cardType),
        decoration: BoxDecoration(
            color: Color(_color),
            borderRadius: new BorderRadius.all(
                new Radius.circular(borderRadius(_cardType))),
            boxShadow: [
              CustomBoxShadow(
                  color: const Color(0xff494949),
                  offset: Offset(0.0, 0.0),
                  blurRadius: 2.0,
                  blurStyle: BlurStyle.outer),
            ]),
        child: _child);
  }
}
