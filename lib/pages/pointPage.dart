import 'package:flutter/material.dart';

class PointPage extends StatefulWidget {
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Center(child: Text("點數",style: TextStyle(fontSize: 20.0),)),
    );
  }
}
