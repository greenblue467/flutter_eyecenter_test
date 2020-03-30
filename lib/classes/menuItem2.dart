import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MenuItem2 extends StatelessWidget {
  final String text;
  final double num1;
  final double num2;
  final Widget page;
  final type;

  MenuItem2(
      {this.text,
      this.num1 = 5.0,
      this.num2 = 5.0,
      this.page,
      this.type = PageTransitionType.downToUp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(child: page, type: type),
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(40.0, num1, 0.0, num2),
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0),
          ),
        ));
  }
}
