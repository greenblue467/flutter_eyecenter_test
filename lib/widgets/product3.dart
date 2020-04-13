import 'package:eyecentertestapp/classes/collapse.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../data.dart';


class Product3 extends StatefulWidget {
  @override
  _Product3State createState() => _Product3State();
}

class _Product3State extends State<Product3> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ExpandableTheme(
          child: ListView(
            controller: Provider.of<Data>(context,listen: false).controlScroll,//測試用，若要使用必須三個product widget都要設定，否則一開始若沒有在此widget就會報錯
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
