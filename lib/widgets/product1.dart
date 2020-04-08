import 'dart:ui';
import 'package:eyecentertestapp/classes/warning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Product1 extends StatefulWidget {
  @override
  _Product1State createState() => _Product1State();
}

class _Product1State extends State<Product1>
    with AutomaticKeepAliveClientMixin {
  bool _loading = false;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    Provider.of<Data>(context, listen: false).product1.add(
        (Provider.of<Data>(context, listen: false).product1.length + 1)
            .toString());
    _refreshController.loadComplete();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent() async {
    try {
      setState(() {
        _loading = true;
      });
      var response =
          await http.get("http://apiv2.eyeglasses.com.tw/Brand/Get?Type=cl");
      setState(() {
        _loading = false;
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        Provider.of<Data>(context, listen: false).setProduct1(jsonResponse);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context, listen: false);
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.width / 2.17;
    super.build(context);
    return ModalProgressHUD(
      inAsyncCall: _loading,
      color: Colors.white,
      child: Stack(children: [
        SmartRefresher(
          enablePullDown: true,
          header: ClassicHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            padding: EdgeInsets.all(0.0),
            itemCount: provide.product1.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  provide.setSpin(true);
                  provide.setProduct1Id(provide.product1[index]["Id"]);
                  provide.getProduct1Detail(context);
                },
                child: Container(
                  width: wid,
                  height: hei,
                  margin: EdgeInsets.only(
                      bottom:
                          index == provide.product1.length - 1 ? 120.0 : 0.0),
                  child: Image.network(
                    provide.product1[index]["BrandImg"],
                    loadingBuilder: (context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                          child: Text(
                        "讀取中 ⋯",
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      ));
                    },
                  ),
                ),
              );
            },
          ),
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
                  decoration:
                      new BoxDecoration(color: Colors.black.withOpacity(0.0)),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Warning(),
        ),
      ]),
    );
  }
}
