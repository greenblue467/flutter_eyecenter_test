import 'dart:async';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PointPage extends StatefulWidget {
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String u = "https://flutter.dev/";
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    //_launchURL();
  }

  /*Future<void> _launchURL() async {
    try {
      bool can=await canLaunch("https://flutter.dev/");
      if (can) {
        await launch("https://flutter.dev/");
      } else {
        throw 'Could not launch';
      }
    } catch (e) {
      print(e);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        color: Colors.white,
        child: WebView(
          initialUrl: "https://flutter.dev/",
          javascriptMode:
              JavascriptMode.unrestricted, //for opening to a new url
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onPageStarted: (url) {
            setState(() {
              _loading = true;
            });
            if (u != url) {
              String parameter = url.substring(20);
              print(parameter); //用此來傳url參數給後端
            }
            setState(() {
              u = url;
            });
          },
          onPageFinished: (_){
            setState(() {
              _loading = false;
            });
          },
        ),
      ),
    );
  }
}
