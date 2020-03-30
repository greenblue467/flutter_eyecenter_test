import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              labelStyle: TextStyle(fontSize: 16.0),
              labelColor: Colors.lightGreenAccent,
              unselectedLabelColor:Colors.white ,
              indicatorColor: Colors.lightGreenAccent,
              tabs: <Widget>[
                Tab(
                  text: "門市據點",
                ),
                Tab(
                  text: "附近門市",
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(child: Text("Store"),),
          )
        ],
      ),
    );
  }
}
