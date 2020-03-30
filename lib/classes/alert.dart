import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../constValues.dart';

class Alert {
  void alert1(text, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(
            "貼心小提醒",
            textAlign: TextAlign.center,
          ),
          content: Text(
            text,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  child: Text(
                    "確定",
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void alert2(text1, text2, page, context,boolVal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(
            "登入失敗",
            textAlign: TextAlign.center,
          ),
          content: Text(
            text1,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  child: Text(
                    text2,
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        PageTransition(
                            child: page, type: PageTransitionType.downToUp,settings: RouteSettings(isInitialRoute: boolVal)));
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  child: Text(
                    "返回",
                    style: textStyle,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void alert3(text1, text2,  context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(
            "注意",
            textAlign: TextAlign.center,
          ),
          content: Text(
            text1,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  child: Text(
                    text2,
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    Navigator.popUntil(context, (route)=>route.isFirst);
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  child: Text(
                    "返回",
                    style: textStyle,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
