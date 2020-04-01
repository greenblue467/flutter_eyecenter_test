import 'dart:ui';
import 'package:eyecentertestapp/classes/alert.dart';
import 'package:eyecentertestapp/classes/warning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../data.dart';
import 'package:provider/provider.dart';
import './product1Final.dart';

class Product1Detail extends StatelessWidget {
  final int co = 0xffE1005A;
  final Alert showAlert = Alert();
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }



  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context);
    final detail = provide.product1Detail["Products"];
    void _onLoading() async {
      await Future.delayed(Duration(milliseconds: 1000));
      Provider.of<Data>(context, listen: false)
          .product1Detail["Products"].add(
          (Provider.of<Data>(context, listen: false)
              .product1Detail["Products"].length + 1)
              .toString());
      _refreshController.loadComplete();
    }
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
              SmartRefresher(
                enablePullDown: true,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.builder(
                    itemCount: Provider.of<Data>(context, listen: false)
                        .product1Detail["Products"]
                        .length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: index ==
                                Provider.of<Data>(context, listen: false).product1Detail["Products"].length - 1
                                ? 120.0
                                : 0.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.grey[200], Colors.white]),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
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
                              color: Color(int.parse(
                                  "0xff${detail[index]["ProductNameColor"]}")),
                            ),
                          ),
                          subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              style:
                                                  TextStyle(color: Colors.black),
                                              children: [
                                                TextSpan(
                                                  text: Provider.of<Data>(context,
                                                              listen: false)
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
                                                      int.parse(
                                                          "0xff${detail[index]["T01Color"]}"),
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(
                                                    text: detail[index]
                                                        ["Description2"],
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ))
                                              ]),
                                        ),
                                        Container(
                                          child: provide.verify1
                                              ? Row(children: [
                                                  Container(
                                                    color: Color(
                                                      int.parse(
                                                          "0xff${detail[index]["T02BgColor"]}"),
                                                    ),
                                                    child: Text(
                                                      detail[index]["T02Text"],
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Color(
                                                          int.parse(
                                                              "0xff${detail[index]["T02Color"]}"),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Color(
                                                      int.parse(
                                                          "0xff${detail[index]["T03BgColor"]}"),
                                                    ),
                                                    child: Text(
                                                      detail[index]["T03Text"],
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Color(
                                                          int.parse(
                                                              "0xff${detail[index]["T03Color"]}"),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ])
                                              : Text(
                                                  detail[index]["HintText"],
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Color(
                                                        int.parse(
                                                            "0xff${detail[index]["HintColor"]}"),
                                                      )),
                                                ),
                                        ),
                                        Container(
                                          child: provide.verify1
                                              ? Text(
                                                  detail[index]["Description"],
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              : Text("活動說明"),
                                        ),
                                      ]),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Theme.of(context).primaryColor,
                                  size: 18.0,
                                )
                              ]),
                          isThreeLine: true,
                          onTap: () {
                            if (provide.verify1) {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => Product1Final(index),
                                ),
                              );
                            } else {
                              showAlert.alert1("請先登入會員", context);
                            }
                          },
                        ),
                      );
                    }),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100.0,
                        decoration: new BoxDecoration(
                            color: Colors.black.withOpacity(0.0)),
                      ),
                    ),
                  ),
                ),
              ),
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
