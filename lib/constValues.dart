import 'package:flutter/material.dart';

const textStyle = TextStyle(fontSize: 20.0);

RoundedRectangleBorder btnStyle({color = Colors.red}) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
      side: BorderSide(color: color));
}

InputDecoration inputStyle({context, text = "手機號碼"}) {
  return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
      hintText: text,
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(50.0))));
}

const List<String> degree = [
  "0",
  "100",
  "125",
  "150",
  "175",
  "200",
  "225",
  "250",
  "275",
  "300",
  "325",
  "350",
  "400",
  "425",
  "450",
  "475",
  "500",
  "525",
  "550",
  "575",
  "600",
  "650",
  "700",
  "750",
  "800",
  "850",
  "900",
  "950",
  "1000",
  "1050",
  "1100",
  "1150",
  "1200"
];

const List<String> quantity = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
];
