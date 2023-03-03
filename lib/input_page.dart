import 'package:bmi_calculater/calculater_brain.dart';
import 'package:bmi_calculater/constants.dart';
import 'package:bmi_calculater/result_page.dart';
import 'package:bmi_calculater/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';
import 'icon_content.dart';
import 'shared_card.dart';

enum Gender { female, male }

SliderThemeData sliderStyles = SliderThemeData(
    activeTrackColor: Colors.white,
    thumbColor: Color(0xFFEB1555),
    overlayColor: Color(0x29EB1555),
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0));

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.female;
  int height = 180;
  int weight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: SharedCard(
                  colour: selectedGender == Gender.male
                      ? kActiveColour
                      : kInActiveColour,
                  child: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                )),
                Expanded(
                    child: SharedCard(
                  colour: selectedGender == Gender.female
                      ? kActiveColour
                      : kInActiveColour,
                  child: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ))
              ],
            )),
            Expanded(
                child: SharedCard(
              colour: kActiveColour,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text('cm'),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: Color(0xFF8DE98),
                          onChanged: (double value) {
                            setState(() {
                              height = value.toInt();
                            });
                            print(value);
                          }),
                    )
                  ]),
              onPress: () => null,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: SharedCard(
                        colour: kActiveColour,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        weight++;
                                      });
                                    }),
                                SizedBox(width: 10.0),
                                RoundedButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        if (weight > 0) {
                                          weight--;
                                        }
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                        onPress: () => null)),
                Expanded(
                    child: SharedCard(
                        colour: kActiveColour,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                                SizedBox(width: 10.0),
                                RoundedButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        if (age > 0) {
                                          age--;
                                        }
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                        onPress: () => null))
              ],
            )),
            BottomButton(
              text: "CALCULATE",
              onPress: () {
                CalculaterBrain calcBMI =
                    CalculaterBrain(weight: weight, height: height);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: calcBMI.calculateBMI(),
                      result: calcBMI.getResult(),
                      finalResult: calcBMI.getFinalResult(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
