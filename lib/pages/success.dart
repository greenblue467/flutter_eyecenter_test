import 'package:eyecentertestapp/classes/apiCalls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  var _content;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent() async {
    ApiCalls info = ApiCalls();
    var content = await info.get(12);
    setState(() {
      _content = content;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          leading: Text(""),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "註冊成功",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 30.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: ListView(children: [
                  Html(
                    data: _loading ? "" : _content[0]["HTML"],
                    defaultTextStyle: TextStyle(fontSize: 18.0),
                  ),
                ]),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.only(bottom: 20.0,top: 10.0),
              child: FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text("離開此頁",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                onPressed: () {
                  Navigator.of(context).popUntil((route)=>route.isFirst);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
