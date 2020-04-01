import 'package:eyecentertestapp/classes/memberContainer.dart';
import 'package:eyecentertestapp/constValues.dart';
import 'package:eyecentertestapp/pages/about.dart';
import 'package:eyecentertestapp/pages/myPoint.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../data.dart';
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
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MemberContainer("個人資料", EdgeInsets.only(right: 30.0),
                          Icons.person_outline,About()),
                      Container(
                        height: 140.0,
                        width: 1.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      MemberContainer("推薦好友", EdgeInsets.only(left: 30.0),
                          Icons.people_outline,About()),
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
                      MemberContainer("我的點數", EdgeInsets.only(right: 30.0),
                          Icons.control_point_duplicate,MyPoint()),
                      Container(
                        height: 140.0,
                        width: 1.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      MemberContainer("我的訂單", EdgeInsets.only(left: 30.0),
                          Icons.done,About()),
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
              style: TextStyle(fontSize: 20.0, color: Colors.black54),
            ),
          ),
        )
      ],
    ));
  }
}
