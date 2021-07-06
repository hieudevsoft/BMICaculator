import 'package:flutter/material.dart';

import 'firstpage.dart';

class UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Caculator",
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: BMICaculator(),
    );
  }
}
