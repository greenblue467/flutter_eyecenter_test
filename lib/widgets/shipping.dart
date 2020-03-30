import 'package:flutter/material.dart';

class Shipping extends StatefulWidget {
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(top: 40.0),
                child: Center(child: Text("配送")),
    ))],
        ));
  }
}
