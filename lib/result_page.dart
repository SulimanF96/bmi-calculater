import 'package:bmi_calculater/constants.dart';
import 'package:bmi_calculater/shared_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.bmi, required this.result, required this.finalResult});

  final String bmi;
  final String result;
  final String finalResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Result")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Your result",
                    style: kTitleLargeText,
                  ))),
          Expanded(
              flex: 5,
              child: SharedCard(
                  colour: kActiveColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(result, style: kResultText),
                      Text(bmi, style: kBMIText),
                      Text(finalResult,
                          textAlign: TextAlign.center, style: kResultPar)
                    ],
                  ),
                  onPress: () {})),
          BottomButton(
            text: "RE-CALCULATE",
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
