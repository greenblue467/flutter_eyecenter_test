import 'package:eyecentertestapp/pages/about.dart';
import 'package:flutter/material.dart';

class Product2 extends StatefulWidget {
  @override
  _Product2State createState() => _Product2State();
}

class _Product2State extends State<Product2> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ),
                  );
                },
                child: Text(
                  index == 49 ? "測試" : "test",
                  style: TextStyle(fontSize: 30.0),
                ));
          }),
    );
  }
}
