import 'dart:ui';
import 'package:eyecentertestapp/classes/alert.dart';
import 'package:eyecentertestapp/classes/quantityText.dart';
import 'package:eyecentertestapp/classes/warning.dart';
import 'package:eyecentertestapp/constValues.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import '../constValues.dart';

class Product1Final extends StatefulWidget {
  final int index;

  Product1Final(this.index);

  @override
  _Product1FinalState createState() => _Product1FinalState();
}

class _Product1FinalState extends State<Product1Final> {
  Alert showAlert = Alert();
  bool _showSelect = false;
  final List quantityList = quantity.map((val) => QuantityText(val)).toList();
  int quantityL = 0;
  int quantityR = 0;

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context);
    final detail = provide.product1Detail["Products"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        centerTitle: true,
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
                child: Hero(
                  tag: detail[widget.index],
                  child: Image.network(detail[widget.index]["ImagePath"],
                      fit: BoxFit.cover),
                ),
              ),
              title: Text(
                detail[widget.index]["ProductName"],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(int.parse(
                      "0xff${detail[widget.index]["ProductNameColor"]}")),
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
                                  ? detail[widget.index]["Price"]
                                  : detail[widget.index]["FixPrice"],
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(
                                  int.parse(
                                      "0xff${detail[widget.index]["HintColor"]}"),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: detail[widget.index]["T01Text"],
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(
                                  int.parse(
                                      "0xff${detail[widget.index]["T01Color"]}"),
                                ),
                              ),
                            ),
                            TextSpan(
                                text: detail[widget.index]["Description2"],
                                style: TextStyle(
                                  fontSize: 16.0,
                                ))
                          ]),
                    ),
                    Container(
                      child: Row(children: [
                        Container(
                          color: Color(
                            int.parse(
                                "0xff${detail[widget.index]["T02BgColor"]}"),
                          ),
                          child: Text(
                            detail[widget.index]["T02Text"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(
                                int.parse(
                                    "0xff${detail[widget.index]["T02Color"]}"),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Color(
                            int.parse(
                                "0xff${detail[widget.index]["T03BgColor"]}"),
                          ),
                          child: Text(
                            detail[widget.index]["T03Text"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(
                                int.parse(
                                    "0xff${detail[widget.index]["T03Color"]}"),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      child: Text(
                        detail[widget.index]["Description"],
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
                    builder: (context) => Product1Final(widget.index),
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
                            data: detail[widget.index]["HTML01"],
                          )
                        ],
                      ),
                    ),
                  ),
                  _showSelect
                      ? Container(
                          color: Colors.grey[50],
                          child: Column(children: [
                            Container(
                                color: Theme.of(context).primaryColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        "取消",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showSelect = false;
                                          quantityL = 0;
                                          quantityR = 0;
                                        });
                                      },
                                    ),
                                    FlatButton(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "確定",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showSelect = false;
                                        });
                                        if (Provider.of<Data>(context,
                                                listen: false)
                                            .cart
                                            .map((name) {
                                          return name["Name"];
                                        }).contains(Provider.of<Data>(context,
                                                        listen: false)
                                                    .product1Detail["Products"][
                                                widget.index]["ProductName"])) {
                                          showAlert.alert1(
                                              "該商品已在配送清單中，您可以刪除配送資料，再重新挑選盒數",
                                              context);
                                        } else {
                                          if (quantityR == 0 &&
                                              quantityL == 0) {
                                            showAlert.alert1(
                                                "您未挑選盒數！", context);
                                          } else {
                                            Provider.of<Data>(context, listen: false).addToCart(
                                                Provider.of<Data>(context, listen: false)
                                                            .product1Detail["Products"]
                                                        [widget.index]
                                                    ["ProductName"],
                                                Provider.of<Data>(context,
                                                            listen: false)
                                                        .product1Detail["Products"]
                                                    [widget.index]["ImagePath"],
                                                quantityL,
                                                quantityR,
                                                Provider.of<Data>(context,
                                                            listen: false)
                                                        .product1Detail["Products"]
                                                    [widget.index]["Price"],
                                                true,
                                                context);
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .saveCart();

                                            int money = (quantityL +
                                                    quantityR) *
                                                int.parse(Provider.of<Data>(
                                                                context,
                                                                listen: false)
                                                            .product1Detail[
                                                        "Products"]
                                                    [widget.index]["Price"]);
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .addTotalPriceList(money.toString());
                                            Provider.of<Data>(context,
                                                listen: false)
                                                .saveTotalPriceList();
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "選擇配送數量",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "左眼：api度",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Text(
                                            "右眼：api度",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 30.0),
                                width: MediaQuery.of(context).size.width / 2,
                                height: 200.0,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: 0),
                                  backgroundColor: Colors.grey[50],
                                  itemExtent: 30.0,
                                  children: quantityList,
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      quantityL =
                                          int.parse(quantityList[index].text);
                                    });
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 30.0),
                                width: MediaQuery.of(context).size.width / 2,
                                height: 200.0,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: 0),
                                  backgroundColor: Colors.grey[50],
                                  itemExtent: 30.0,
                                  children: quantityList,
                                  onSelectedItemChanged: (index) {
                                    quantityR =
                                        int.parse(quantityList[index].text);
                                  },
                                ),
                              )
                            ]),
                          ]))
                      : Container(
                          child: Column(
                            children: <Widget>[
                              Row(children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.fromLTRB(
                                      15.0, 15.0, 7.5, 15.0),
                                  child: FlatButton(
                                    padding: EdgeInsets.all(15.0),
                                    shape: btnStyle(color: Colors.redAccent),
                                    color: Colors.redAccent,
                                    child: Text(
                                      "加入配送",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _showSelect = true;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.fromLTRB(
                                      7.5, 15.0, 15.0, 15.0),
                                  child: FlatButton(
                                    padding: EdgeInsets.all(15.0),
                                    shape: btnStyle(
                                        color: Theme.of(context).primaryColor),
                                    color: Theme.of(context).primaryColor,
                                    child: Text(
                                      "配送服務",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      Provider.of<Data>(context, listen: false)
                                          .setIndex(4);
                                      Navigator.of(context)
                                          .popUntil((route) => route.isFirst);
                                    },
                                  ),
                                ),
                              ]),
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
