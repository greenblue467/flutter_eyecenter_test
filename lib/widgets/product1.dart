import 'dart:ui';
import 'package:eyecentertestapp/classes/warning.dart';
import 'package:eyecentertestapp/pages/product1Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../data.dart';

class Product1 extends StatefulWidget {
  @override
  _Product1State createState() => _Product1State();
}

class _Product1State extends State<Product1> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent() async {
    try {
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
    return ModalProgressHUD(
      inAsyncCall: _loading,
      color: Colors.white,
      child: Stack(children: [
        ListView.builder(
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
                child: Image(
                  image: NetworkImage(
                    Provider.of<Data>(context).product1[index]["BrandImg"],
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120.0,
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
