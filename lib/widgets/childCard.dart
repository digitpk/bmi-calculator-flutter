import 'package:bmi_calculator/constants/styles.dart';
import 'package:flutter/material.dart';

class ChildCardWidget extends StatelessWidget {
  ChildCardWidget({this.mytext, this.myIcon});

  final String mytext;
  final IconData myIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          mytext,
          style: kMyTextStyle,
        ),
      ],
    );
  }
}
