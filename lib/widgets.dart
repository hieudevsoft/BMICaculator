import 'package:flutter/material.dart';

import 'constants.dart';
import 'enums.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour,
      this.cardChild = const Text("e"),
      required this.onPress});
  final Color colour;
  final Widget cardChild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}

class InsideContent extends StatelessWidget {
  InsideContent({required this.gender, required this.icon});
  final Gender gender;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender.toString().split(".")[1],
          style: labelTextStyle,
        )
      ],
    );
  }
}
