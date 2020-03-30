import 'package:eyecentertestapp/constValues.dart';
import 'package:eyecentertestapp/pages/verify1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import 'package:page_transition/page_transition.dart';
import './rules.dart';
import './policy.dart';
import '../classes/alert.dart';
import '../classes/navigate.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class NewAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  Alert showAlert = Alert();
  String _number;

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context, listen: false);
    TextEditingController _control =
        TextEditingController(text: Provider.of<Data>(context).phone);
    _control.selection =
        TextSelection.fromPosition(TextPosition(offset: _control.text.length));
    return ModalProgressHUD(
      inAsyncCall: provide.spin,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 50.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40.0),
                    child: Text(
                      "您的手機號碼",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 30.0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  style: TextStyle(fontSize: 20.0),
                                  textAlign: TextAlign.center,
                                  decoration: inputStyle(
                                      context: context, text: "如：0968168168"),
                                  controller: _control,
                                  onChanged: (val) {
                                    provide.setPhone(val);
                                  },
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                FlatButton(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  onPressed: () {
                                    int allNumber = int.tryParse(provide.phone);
                                    provide.reSendVal(false);
                                    if (allNumber != null) {
                                      if (provide.phone.length == 10 &&
                                          provide.phone[0] == "0" &&
                                          provide.phone[1] == "9") {
                                        if (provide.time == 120) {
                                          provide.register(context);
                                          setState(() {
                                            _number = provide.phone;
                                          });
                                        } else {
                                          if (_number == provide.phone) {
                                            Navigator.push(context,
                                                CupertinoPageRoute(
                                                    builder: (context) {
                                              return Verify1(
                                                action: Navigate().push,
                                                setVerify: provide.setVerity,
                                                saveVerify: provide.nothing,
                                              );
                                            }));
                                          } else {
                                            provide.register(context);
                                            provide.countCancel();
                                            setState(() {
                                              _number = provide.phone;
                                            });
                                            provide.setTime();
                                          }
                                        }
                                      } else {
                                        showAlert.alert1("請檢查電話號碼或格式", context);
                                      }
                                    } else {
                                      if (provide.phone.isEmpty) {
                                        showAlert.alert1(
                                            "請輸入電話號碼"
                                            "",
                                            context);
                                      } else {
                                        showAlert.alert1("請檢查電話號碼或格式", context);
                                      }
                                    }
                                  },
                                  shape: btnStyle(
                                      color: Theme.of(context).primaryColor),
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    "註冊",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15.0),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12.0),
                                          children: [
                                            TextSpan(
                                              text: "當您進行註冊，即代表您同意本",
                                            ),
                                            TextSpan(
                                                text: "服務條款",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () => Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          settings: RouteSettings(
                                                              isInitialRoute:
                                                                  true),
                                                          child: Rules(),
                                                          type: PageTransitionType
                                                              .downToUp))),
                                            TextSpan(
                                              text: "及",
                                            ),
                                            TextSpan(
                                                text: "隱私權政策",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () => Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          settings: RouteSettings(
                                                              isInitialRoute:
                                                                  true),
                                                          child: Policy(),
                                                          type: PageTransitionType
                                                              .downToUp))),
                                          ]),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              child: Text("已有帳號 ？",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          Theme.of(context).primaryColorDark)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
