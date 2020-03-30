import 'package:eyecentertestapp/classes/warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../data.dart';
import 'package:provider/provider.dart';

class Product1Detail extends StatelessWidget {
  final int co = 0xffE1005A;

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
      body: Column(children: [
        Container(
          child: Image(
            image: NetworkImage(
              provide.product1Detail["BrandImg"],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              ListView.builder(
                  itemCount: Provider.of<Data>(context, listen: false)
                      .product1Detail["Products"]
                      .length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage(
                          detail[index]["ImagePath"],
                        ),
                      ),
                      title: Text(
                        detail[index]["ProductName"],
                        style: TextStyle(
                          color: Color(int.parse(
                              "0xff${detail[index]["ProductNameColor"]}")),
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
                                  text:
                                      Provider.of<Data>(context, listen: false)
                                              .verify1
                                          ? detail[index]["Price"]
                                          : detail[index]["FixPrice"],
                                  style: TextStyle(
                                    color: Color(
                                      int.parse(
                                          "0xff${detail[index]["HintColor"]}"),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: detail[index]["T01Text"],
                                  style: TextStyle(
                                    color: Color(
                                      int.parse(
                                          "0xff${detail[index]["T01Color"]}"),
                                    ),
                                  ),
                                ),
                                TextSpan(text: detail[index]["Description2"])
                              ]),
                        ),
                        Container(color: Colors.red,height: 10,width: 10,)
                      ]),
                      isThreeLine: true,
                    );
                  }),
              Positioned(
                bottom: 0.0,
                child: Warning(),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
