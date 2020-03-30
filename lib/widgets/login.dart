import 'package:eyecentertestapp/pages/newAccount.dart';
import 'package:eyecentertestapp/pages/verify1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import "../pages/newAccount.dart";
import 'package:page_transition/page_transition.dart';
import '../classes/alert.dart';
import '../constValues.dart';
import '../classes/navigate.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _number;
  Alert showAlert = Alert();

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context, listen: false);
    TextEditingController _control =
        TextEditingController(text: Provider.of<Data>(context).phone);
    _control.selection = TextSelection.fromPosition(TextPosition(offset: _control.text.length));
    return ModalProgressHUD(
      inAsyncCall: provide.spin,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
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
                  padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            TextField(
                              controller: _control,
                              keyboardType: TextInputType.number,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              onChanged: (val) {
                                provide.setPhone(val);
                              },
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0),
                              decoration: inputStyle(context: context),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              onPressed: () {
                                int allNumber = int.tryParse(provide.phone);
                                provide.reSendVal(false);
                                if (provide.phone.isEmpty) {
                                  showAlert.alert1("請輸入電話號碼", context);
                                } else if (provide.phone.length == 10 &&
                                    provide.phone[0] == "0" &&
                                    provide.phone[1] == "9") {
                                  if (allNumber != null) {
                                    if (provide.time == 120) {
                                      provide.logInStatus(context);
                                      setState(() {
                                        _number = provide.phone;
                                      });
                                    } else if (provide.time < 120) {
                                      if (_number == provide.phone) {
                                        Navigator.push(context,
                                            CupertinoPageRoute(builder: (context) {
                                          return Verify1(action:Navigate().pop,setVerify: provide.setVerity,saveVerify: provide.saveVerify1);
                                        }));
                                      } else {
                                        provide.logInStatus(context);
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
                                  showAlert.alert1("請檢查電話號碼或格式", context);
                                }
                              },
                              child: Text(
                                "登入",
                                style:
                                    TextStyle(fontSize: 20.0, color: Colors.red),
                              ),
                              shape: btnStyle(),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(provide.time<120){
                            provide.countCancel();
                            provide.setTime();
                          }
                          Navigator.push(
                            context,
                            PageTransition(
                                child: NewAccount(),
                                type: PageTransitionType.downToUp),
                          );
                        },
                        child: Container(
                          child: Text(
                            "門市會員建立帳號",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
