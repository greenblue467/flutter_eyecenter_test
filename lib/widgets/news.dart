import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:eyecentertestapp/classes/apiCalls.dart';


class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  var _content;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent() async {
    ApiCalls info = ApiCalls();
    var content = await info.get(1,context);
    setState(() {
      _content = content;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            color: Theme.of(context).primaryColor,
            child: Text(
              "最新消息",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          Expanded(
            child: ModalProgressHUD(
              inAsyncCall: _loading,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                child: ListView(
                    children: [Html(
                      data: _loading ? "" : _content[0]["HTML"],
                      defaultTextStyle: TextStyle(fontSize: 18.0),
                    ),]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
