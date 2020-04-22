import 'package:eyecentertestapp/classes/apiCalls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HowTo extends StatefulWidget {
  @override
  _HowToState createState() => _HowToState();
}

class _HowToState extends State<HowTo> {
  var _content;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent()async{
    ApiCalls info=ApiCalls();
    var content=await info.get(9,context);
    setState(() {
      _content=content;
      _loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "e 大學眼鏡",
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 22.0),
          )),
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Theme.of(context).primaryColor,
              child: Text(
                _loading ? "" : _content[0]["InfoName"],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Html(
                  data: _loading ? "" : _content[0]["HTML"],
                  defaultTextStyle: TextStyle(fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
