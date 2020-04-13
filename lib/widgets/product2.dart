import 'package:eyecentertestapp/pages/about.dart';
import 'package:flutter/material.dart';

class Product2 extends StatefulWidget {
  @override
  _Product2State createState() => _Product2State();
}

class _Product2State extends State<Product2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  ScrollController controllerScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          controller: controllerScroll,
          itemCount: 80,
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
                  index == 79 ? "測試" : "test",
                  style: TextStyle(fontSize: 30.0),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.8),
        child: Icon(
          Icons.arrow_upward,
          color: Colors.grey.withOpacity(0.5),
        ),
        onPressed: () {
          controllerScroll.animateTo(0,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        },
      ),
    );
  }
}
