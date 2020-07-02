import 'package:bmi_calculator/constants/colours.dart';
import 'package:bmi_calculator/constants/styles.dart';
import 'package:bmi_calculator/widgets/footerButton.dart';
import 'package:bmi_calculator/widgets/reuseableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.feedback,
      @required this.bmiCalculate,
      @required this.resultTitle});

  final String bmiCalculate;
  final String resultTitle;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kMyRTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: kCardColours,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultTitle.toUpperCase(),
                    style: kMyBTHeadingStyle,
                  ),
                  Text(
                    bmiCalculate,
                    style: kMyBMIResultsStyle,
                  ),
                  Text(
                    feedback,
                    textAlign: TextAlign.center,
                    style: kMyBMIRemarks,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            tapping: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
