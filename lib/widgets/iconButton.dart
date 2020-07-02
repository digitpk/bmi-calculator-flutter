import 'package:bmi_calculator/constants/colours.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  MyIconButton({@required this.mBIcon, @required this.myCounter});

  final IconData mBIcon;
  final Function myCounter;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(mBIcon),
      shape: CircleBorder(),
      fillColor: kIconButton,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: myCounter,
    );
  }
}
