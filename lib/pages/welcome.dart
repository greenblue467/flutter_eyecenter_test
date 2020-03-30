import 'package:flutter/material.dart';
import '../constValues.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  final List coloList = [Colors.blue, Colors.green, Colors.redAccent];
  int _i = 0;
  AnimationController control;

  @override
  void initState() {
    super.initState();
    control = AnimationController(duration: Duration(seconds: 5), vsync: this);
    control.forward();
    control.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CarouselSlider(
          onPageChanged: (index) {
            setState(() {
              _i = index;
            });
          },
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          height: MediaQuery.of(context).size.height,
          items: coloList.map((style) {
            return Container(
              color: style,
            );
          }).toList(),
        ),
        Positioned(
          left: (MediaQuery.of(context).size.width / 2) - 35,
          bottom: 200,
          child: Container(
            width: 70.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                      color: _i == 0 ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                      color: _i == 1 ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                      color: _i == 2 ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                )
              ],
            ),
          ),
        ),
        _i == 2
            ? Positioned(
                bottom: 100,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: btnStyle(color: Colors.white.withOpacity(control.value)),
                      child: Text(
                        "開始使用",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white.withOpacity(control.value)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              )
            : Text(""),
        _i==0?Positioned(
          top: 220,
          child: Container(
            margin: EdgeInsets.only(left: 80),
            child: Column(children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "大學眼鏡",
                    style: TextStyle(fontSize: 40.0),
                  ),
                  TextSpan(
                    text: "APP",
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.w800),
                  ),
                ]),
              ),
              Text(
                "矚目上架",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 60.0,
                    color: Colors.white),
              ),
              Stack(
                  textDirection: TextDirection.ltr,
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        border: Border(
                          left: BorderSide(color: Colors.white, width: 2.0),
                          top: BorderSide(color: Colors.white, width: 2.0),
                          bottom: BorderSide(color: Colors.white, width: 2.0),
                          right: BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "大優惠＋全新服務",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ])
            ]),
          ),
        ):Text(""),
      ]),
    );
  }
}
