import 'package:bmi_calculator/function/calculator_brain.dart';
import 'package:bmi_calculator/widgets/footerButton.dart';
import 'package:bmi_calculator/widgets/iconButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colours.dart';
import '../constants/styles.dart';
import '../widgets/childCard.dart';
import '../widgets/reuseableCard.dart';
import 'result_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender myGender;
  int myHeight = 180;
  int myWeight = 60;
  int myAge = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    pressingCard: () {
                      setState(() {
                        myGender = Gender.male;
                      });
                    },
                    colour:
                        myGender == Gender.male ? kCardColours : kNocardColours,
                    cardChild: ChildCardWidget(
                      myIcon: FontAwesomeIcons.mars,
                      mytext: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    pressingCard: () {
                      setState(() {
                        myGender = Gender.female;
                      });
                    },
                    colour: myGender == Gender.female
                        ? kCardColours
                        : kNocardColours,
                    cardChild: ChildCardWidget(
                      myIcon: FontAwesomeIcons.venus,
                      mytext: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: kCardColours,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kMyTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        myHeight.toString(),
                        style: kMyCounterStyle,
                      ),
                      Text(
                        'cm',
                        style: kMyTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTickMarkColor: Colors.grey,
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: myHeight.toDouble(),
                      min: 100.0,
                      max: 300.0,
                      onChanged: (double newheight) {
                        setState(() {
                          myHeight = newheight.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    colour: kCardColours,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kMyTextStyle,
                        ),
                        Text(
                          myWeight.toString(),
                          style: kMyCounterStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyIconButton(
                              mBIcon: FontAwesomeIcons.minus,
                              myCounter: () {
                                setState(() {
                                  myWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            MyIconButton(
                              mBIcon: FontAwesomeIcons.plus,
                              myCounter: () {
                                setState(() {
                                  myWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kCardColours,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kMyTextStyle,
                        ),
                        Text(
                          myAge.toString(),
                          style: kMyCounterStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIconButton(
                              mBIcon: FontAwesomeIcons.minus,
                              myCounter: () {
                                setState(() {
                                  myAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            MyIconButton(
                              mBIcon: FontAwesomeIcons.plus,
                              myCounter: () {
                                setState(() {
                                  myAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            tapping: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: myHeight, weight: myWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiCalculate: calc.calculation(),
                    resultTitle: calc.resultText(),
                    feedback: calc.getFeedback(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
