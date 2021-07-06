import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_app/secondpage.dart';
import 'package:my_first_app/widgets.dart';
import 'caculator.dart';
import 'constants.dart';
import 'RoundedButton.dart';
import 'enums.dart';

class BMICaculator extends StatefulWidget {
  @override
  _BMICaculatorState createState() => _BMICaculatorState();
}

class _BMICaculatorState extends State<BMICaculator> {
  Gender selectedGender = Gender.MALE;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI Caculator"),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ReusableCard(
                      colour: selectedGender == Gender.MALE
                          ? activeColourCard
                          : inactiveColourText,
                      cardChild: InsideContent(
                          gender: Gender.MALE, icon: FontAwesomeIcons.mars),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                    ),
                    ReusableCard(
                      cardChild: InsideContent(
                          gender: Gender.FEMALE, icon: FontAwesomeIcons.venus),
                      colour: selectedGender == Gender.FEMALE
                          ? activeColourCard
                          : inactiveColourText,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                    )
                  ],
                ),
              ),
              ReusableCard(
                colour: activeColourCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text('cm', style: TextStyle(color: activeColourText))
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        minThumbSeparation: 1.0,
                        trackHeight: 2.0,
                        trackShape: RoundedRectSliderTrackShape(),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 16.0),
                        activeTrackColor: Colors.red,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.red,
                      ),
                      child: Slider(
                        min: 120,
                        max: 220,
                        value: height.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
                onPress: () {},
              ),
              Expanded(
                child: Row(
                  children: [
                    ReusableCard(
                      colour: activeColourCard,
                      onPress: () {},
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            weight.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              RoundedButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ReusableCard(
                        colour: activeColourCard,
                        onPress: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: labelTextStyle,
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              age.toString(),
                              style: numberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RoundedButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                RoundedButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              result: CalulatorBrain(
                                  height: height, weight: weight))));
                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "CACULATOR",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  height: bottomHeightContainer,
                  color: bottomContainerColour,
                  margin: EdgeInsets.only(top: 18.0),
                ),
              )
            ],
          ),
        ));
  }
}
