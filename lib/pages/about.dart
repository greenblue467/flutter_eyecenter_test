import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../classes/apiCalls.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  var _content;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent() async {
    ApiCalls info = ApiCalls();
    var content = await info.get(1);
    setState(() {
      _content = content;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "e 大學眼鏡",
          style:
          TextStyle(fontSize: 22.0, color: Theme.of(context).primaryColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
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
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                child: ListView(
                    children: [Html(
                      data: _loading ? "" : _content[0]["HTML"],
                      defaultTextStyle: TextStyle(fontSize: 18.0),
                    ),]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
