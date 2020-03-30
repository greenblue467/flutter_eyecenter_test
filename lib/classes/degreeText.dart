import 'package:flutter/material.dart';

class DegreeText extends StatelessWidget {
  final String text;
  DegreeText(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0),
    );
  }
}
