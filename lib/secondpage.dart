import 'package:flutter/material.dart';
import 'package:my_first_app/constants.dart';
import 'package:my_first_app/widgets.dart';
import 'caculator.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.result});
  final CalulatorBrain result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Caculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              "YOUR RESULT",
              style: numberTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.getResult(),
                    style: labelTextStyleResult,
                  ),
                  Text(
                    result.caculateBMI(),
                    style: numberTextStyleResult,
                  ),
                  Text(
                    result.getInterpretation(),
                    textAlign: TextAlign.center,
                    style: bodyTextStyleResult,
                  )
                ],
              ),
              margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
              decoration: BoxDecoration(
                  color: activeColourCard,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 15.0),
              alignment: AlignmentDirectional.center,
              color: bottomContainerColour,
              height: bottomHeightContainer,
              child: Text(
                "RE-CACULATOR",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
