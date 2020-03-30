import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final double num1;
  final double num2;
  final int index;

  MenuItem({this.text, this.num1 = 5.0, this.num2 = 5.0, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          Provider.of<Data>(context, listen: false).setIndex(index);
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
