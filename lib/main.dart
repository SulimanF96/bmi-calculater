import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0a0c22),
          scaffoldBackgroundColor: Color(0xFF0a0c22),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
