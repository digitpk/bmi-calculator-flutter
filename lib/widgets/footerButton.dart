import 'package:bmi_calculator/constants/colours.dart';
import 'package:bmi_calculator/constants/styles.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, @required this.tapping});

  final Function tapping;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapping,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kMyBBStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kBottomColour,
        height: kFooterHeight,
        width: double.infinity,
      ),
    );
  }
}
