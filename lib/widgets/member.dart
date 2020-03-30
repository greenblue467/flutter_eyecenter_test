import 'package:eyecentertestapp/constValues.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../pages/pointPage.dart';

class Member extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          color: Theme.of(context).primaryColor,
          child: Text(
            "會員中心",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 40.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: Column(children: [
                          Icon(
                            Icons.person_outline,
                            size: 120.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            "個人資料",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ]),
                      ),
                      Container(
                        height: 140.0,
                        width: 1.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30.0),
                        child: Column(children: [
                          Icon(
                            Icons.people_outline,
                            size: 120.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            "推薦好友",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 1.0,
                        width: 140.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Container(
                        height: 1.0,
                        width: 140.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: Column(children: [
                          Icon(
                            Icons.control_point_duplicate,
                            size: 120.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            "我的點數",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ]),
                      ),
                      Container(
                        height: 140.0,
                        width: 1.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30.0),
                        child: Column(children: [
                          Icon(
                            Icons.done,
                            size: 120.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            "我的訂單",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(30.0),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            shape: btnStyle(color: Colors.black54),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    child: PointPage(), type: PageTransitionType.downToUp),
              );
            },
            child: Text(
              "我在門市使用點數",
              style: TextStyle(
                fontSize: 20.0,
                  color:Colors.black54
              ),
            ),
          ),
        )
      ],
    ));
  }
}
