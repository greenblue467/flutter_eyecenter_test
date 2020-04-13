import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PointPage extends StatefulWidget {
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  String u="https://flutter.dev/";

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
      body: WebView(
        initialUrl: "https://flutter.dev/",
        javascriptMode: JavascriptMode.unrestricted,//for opening to a new url
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageStarted: (url){
          if(u!=url){
            String parameter=url.substring(20);
            print(parameter);//用此來傳url參數給後端
          }
          setState(() {
            u=url;
          });

        },
      ),
    );
  }
}
