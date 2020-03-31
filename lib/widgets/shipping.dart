import 'package:eyecentertestapp/constValues.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart';

class Shipping extends StatefulWidget {
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context);
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          color: Theme.of(context).primaryColor,
          child: Text(
            "配送清單",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        Expanded(
            child: Container(
          margin: Provider.of<Data>(context, listen: false).cart.isEmpty
              ? EdgeInsets.only(top: 0.0)
              : EdgeInsets.only(top: 0.0),
          child: Provider.of<Data>(context, listen: false).cart.isEmpty
              ? Center(
                  child: Text(
                  "尚無產品加入配送清單",
                  style: TextStyle(fontSize: 20.0),
                ))
              : ListView.builder(
                  itemCount:
                      Provider.of<Data>(context, listen: false).cart.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.grey[200])),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 100,
                                minHeight: 100,
                                maxWidth: 100,
                                maxHeight: 200,
                              ),
                              child: Image.network(provide.cart[index]["Pic"],
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              provide.cart[index]["Name"],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Colors.grey[400],
                                            ),
                                            onPressed: () {
                                              var item=Provider.of<Data>(context,listen: false).cart[index];
                                              Provider.of<Data>(context,listen: false).removeItem(item);
                                              Provider.of<Data>(context,listen: false).saveCart();
                                              String money=Provider.of<Data>(context,listen: false).totalPriceList[index];
                                              Provider.of<Data>(context,listen: false).removeTotalPriceList(money);
                                              Provider.of<Data>(context,listen: false).saveTotalPriceList();
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Provider.of<Data>(context,
                                                    listen: false)
                                                .cart[index]["Check"]
                                            ? Column(
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      "左眼${provide.cart[index]["LeftQ"].toString()}盒",
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "右眼${provide.cart[index]["RightQ"].toString()}盒",
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Text("數量"),
                                      ),
                                      Container(
                                        child: Text(
                                          "共${(Provider.of<Data>(context, listen: false).cart[index]["LeftQ"] + Provider.of<Data>(context, listen: false).cart[index]["RightQ"]).toString()}盒x${provide.cart[index]["Price"]}元=${((Provider.of<Data>(context, listen: false).cart[index]["LeftQ"] + Provider.of<Data>(context, listen: false).cart[index]["RightQ"]) * int.parse(Provider.of<Data>(context, listen: false).cart[index]["Price"])).toString()}元",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
        )),
        Provider.of<Data>(context, listen: false).cart.isEmpty
            ? Text("")
            : Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Provider.of<Data>(context, listen: false)
                                .totalPriceList
                                .isEmpty
                            ? Text("0")
                            : Text(
                                "應付金額${((Provider.of<Data>(context, listen: false).totalPriceList.map((i) => int.parse(i)).toList()).reduce((prev, next) => prev + next)).toString()}元"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "點數折抵",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              shape: btnStyle(
                                  color: Theme.of(context).primaryColor),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: FlatButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "開始配送",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              shape: btnStyle(color: Colors.redAccent),
                              color: Colors.redAccent,
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
      ],
    ));
  }
}
