import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import '../classes/alert.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final double num1;
  final double num2;
  final int index;
  final Alert showAlert = Alert();

  MenuItem({this.text, this.num1 = 5.0, this.num2 = 5.0, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          if (index == 4 &&
              !Provider.of<Data>(context, listen: false).verify1) {
            showAlert.alert1("請先登入會員", context);
            Provider.of<Data>(context, listen: false).setIndex(1);
          } else {
            Provider.of<Data>(context, listen: false).setIndex(index);
          }
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
