import 'package:eyecentertestapp/classes/collapse.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:sticky_headers/sticky_headers.dart';

class Product3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ExpandableTheme(
          child: ListView(
            children: <Widget>[
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blueGrey,
                  child: Text(
                    "台北市",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                content: Column(
                  children: <Widget>[
                    Collapse(),
                    Collapse(),
                    Collapse(),
                    Collapse(),
                  ],
                ),
              ),
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blueGrey,
                  child: Text(
                    "新北市",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                content: Column(
                  children: <Widget>[
                    Collapse(),
                    Collapse(),
                    Collapse(),
                    Collapse(),
                  ],
                ),
              ),
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blueGrey,
                  child: Text(
                    "桃竹苗",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                content: Column(
                  children: <Widget>[
                    Collapse(),
                    Collapse(),
                    Collapse(),
                    Collapse(),
                  ],
                ),
              ),
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blueGrey,
                  child: Text(
                    "花蓮縣",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                content: Column(
                  children: <Widget>[
                    Collapse(),
                    Collapse(),
                    Collapse(),
                    Collapse(),
                  ],
                ),
              ),
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blueGrey,
                  child: Text(
                    "台中市",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                content: Column(
                  children: <Widget>[
                    Collapse(),
                    Collapse(),
                    Collapse(),
                    Collapse(),
                  ],
                ),
              ),
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blueGrey,
                  child: Text(
                    "台南市",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                content: Column(
                  children: <Widget>[
                    Collapse(),
                    Collapse(),
                    Collapse(),
                    Collapse(),
                  ],
                ),
              ),
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.blueGrey,
                  child: Text(
                    "高雄市",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                content: Column(
                  children: <Widget>[
                    Collapse(),
                    Collapse(),
                    Collapse(),
                    Collapse(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
