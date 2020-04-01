import 'package:flutter/material.dart';

class Product2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 50,
          itemBuilder: (context,index){
        return Text(index==49? "測試":"test");
      }),
    );
  }
}