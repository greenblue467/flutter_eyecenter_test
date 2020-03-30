import 'package:flutter/material.dart';
import '../pages/name.dart';

class Navigate{
  void pop(context){
    Navigator.of(context).popUntil((route)=>route.isFirst);
  }
  void push(context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Name()));
  }
}