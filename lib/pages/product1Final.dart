import 'dart:ui';
import 'package:eyecentertestapp/classes/warning.dart';
import 'package:eyecentertestapp/constValues.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../data.dart';

class Product1Final extends StatelessWidget {
  final int index;

  Product1Final(this.index);

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context);
    final detail = provide.product1Detail["Products"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        title: Text(
          "e 大學眼鏡",
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 22.0),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.grey[200], Colors.white]),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 65,
                  minHeight: 100,
                  maxWidth: 70,
                  maxHeight: 200,
                ),
                child: Image.network(detail[index]["ImagePath"],
                    fit: BoxFit.cover),
              ),
              title: Text(
                detail[index]["ProductName"],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(
                      int.parse("0xff${detail[index]["ProductNameColor"]}")),
                ),
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: Provider.of<Data>(context, listen: false)
                                      .verify1
                                  ? detail[index]["Price"]
                                  : detail[index]["FixPrice"],
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(
                                  int.parse(
                                      "0xff${detail[index]["HintColor"]}"),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: detail[index]["T01Text"],
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(
                                  int.parse("0xff${detail[index]["T01Color"]}"),
                                ),
                              ),
                            ),
                            TextSpan(
                                text: detail[index]["Description2"],
                                style: TextStyle(
                                  fontSize: 16.0,
                                ))
                          ]),
                    ),
                    Container(
                      child: Row(children: [
                        Container(
                          color: Color(
                            int.parse("0xff${detail[index]["T02BgColor"]}"),
                          ),
                          child: Text(
                            detail[index]["T02Text"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(
                                int.parse("0xff${detail[index]["T02Color"]}"),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Color(
                            int.parse("0xff${detail[index]["T03BgColor"]}"),
                          ),
                          child: Text(
                            detail[index]["T03Text"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(
                                int.parse("0xff${detail[index]["T03Color"]}"),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      child: Text(
                        detail[index]["Description"],
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ]),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Product1Final(index),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListView(
                        children: <Widget>[
                          Html(
                            data: detail[index]["HTML01"],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(15.0),
                          child: FlatButton(
                            padding: EdgeInsets.all(15.0),
                            shape:
                                btnStyle(color: Theme.of(context).primaryColor),
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              "加入配送",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Warning(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
