import 'package:eyecentertestapp/constValues.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data.dart';

class MyPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context);
    RefreshController _refreshController =
    RefreshController(initialRefresh: false);

    void _onRefresh() async {
      await Future.delayed(Duration(milliseconds: 1000));
      _refreshController.refreshCompleted();
    }

    void _onLoading() async {
      await Future.delayed(Duration(milliseconds: 1000));
      Provider.of<Data>(context, listen: false)
          .pointInfo["AcitveBonus"].add(
          (Provider.of<Data>(context, listen: false)
              .pointInfo["AcitveBonus"].length + 1)
              .toString());
      _refreshController.loadComplete();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "e 大學眼鏡",
          style:
              TextStyle(fontSize: 22.0, color: Theme.of(context).primaryColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            color: Theme.of(context).primaryColor,
            child: Text(
              "我的點數",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  provide.pointInfo["Hint1"],
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                  ),
                ),
                Icon(
                  Icons.monetization_on,
                  color: Colors.yellow[700],
                ),
                Text(
                  provide.pointInfo["Point"].toString(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: SmartRefresher(
                enablePullDown: true,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.builder(
                    itemCount: Provider.of<Data>(context, listen: false)
                        .pointInfo["AcitveBonus"]
                        .length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              provide.pointInfo["AcitveBonus"][index]
                                  ["BonusName"],
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              provide.pointInfo["AcitveBonus"][index]
                                  ["BonusDateTime"],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
