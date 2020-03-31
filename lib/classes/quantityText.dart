import 'package:flutter/material.dart';

class QuantityText extends StatelessWidget {
  final String text;
  QuantityText(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0),
    );
  }
}
