import 'package:eyecentertestapp/widgets/product1.dart';
import 'package:eyecentertestapp/widgets/product2.dart';
import 'package:eyecentertestapp/widgets/product3.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal:0.0),
              labelStyle: TextStyle(fontSize: 16.0),
              labelColor: Colors.lightGreenAccent,
              unselectedLabelColor:Colors.white ,
              indicatorColor: Colors.lightGreenAccent,
              tabs: <Widget>[
                Tab(
                  text: "隱形眼鏡",
                ),
                Tab(
                  text: "鏡框/配件",
                ),
                Tab(
                  text: "金三明葉黃素",
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                children: <Widget>[
                Product1(),
                Product2(),
                Product3(),
              ],),
            ),
          )
        ],
      ),
    );
  }
}
