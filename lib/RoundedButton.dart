import 'package:flutter/material.dart';

import 'constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.icon, required this.onPressed});
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        elevation: 6.0,
        fillColor: colorButtonRaw,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
        onPressed: onPressed);
  }
}
