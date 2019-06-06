import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double height;
  Loader(this.height);
  double strokeWidth = 5;

  @override
  Widget build(BuildContext context) {
    print('$height');
    if (height <= 20) {
      strokeWidth = 2;
    } else if (height <= 40) {
      strokeWidth = 4;
    }

    return Center(
      child: Container(
        height: height,
        width: height,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          backgroundColor: Color(0xff5CC7D8),
          valueColor: AlwaysStoppedAnimation(Color(0xffEC4D62)),
        ),
      ),
    );
  }
}
