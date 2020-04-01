import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import '../constValues.dart';
import '../classes/alert.dart';
import 'package:email_validator/email_validator.dart';
import './success.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _control0 =
        TextEditingController(text: Provider.of<Data>(context).pre);
    _control0.selection =
        TextSelection.fromPosition(TextPosition(offset: _control0.text.length));
    TextEditingController _control1 =
        TextEditingController(text: Provider.of<Data>(context).mail);
    TextEditingController _control2 =
        TextEditingController(text: Provider.of<Data>(context).mail);
    _control2.selection =
        TextSelection.fromPosition(TextPosition(offset: _control2.text.length));
    final provide = Provider.of<Data>(context, listen: false);
    Alert showAlert = Alert();
    return ModalProgressHUD(
      inAsyncCall: provide.spin,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                margin: EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  "電子信箱",
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
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: TextField(
                                      autofocus: true,
                                      controller: _control0,
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          hintText: "請輸入",
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                      onChanged: (val) {
                                        provide.setPre(val);
                                      },
                                    ),
                                  ),
                                  Text(
                                    "@",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _control1,
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                      showCursor: false,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                      onChanged: (val) {},
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              title: Text(
                                                "請選擇",
                                                textAlign: TextAlign.center,
                                              ),
                                              content: TextField(
                                                autofocus: true,
                                                controller: _control2,
                                                style:
                                                    TextStyle(fontSize: 20.0),
                                                textAlign: TextAlign.center,
                                                decoration: inputStyle(
                                                    context: context, text: ""),
                                                onChanged: (val) {
                                                  provide.setMail(val);
                                                },
                                              ),
                                              actions: <Widget>[
                                                Center(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: FlatButton(
                                                      child: Text(
                                                        "gmail.com",
                                                        style: textStyle,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      onPressed: () {
                                                        provide.setMail(
                                                            "gmail.com");
                                                        setState(() {
                                                          _control2.text =
                                                              "gmail.com";
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: FlatButton(
                                                      child: Text(
                                                        "hotmail.com",
                                                        style: textStyle,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          provide.setMail(
                                                              "hotmail.com");
                                                          setState(() {
                                                            _control2.text =
                                                                "hotmail.com";
                                                          });
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: FlatButton(
                                                      child: Text(
                                                        "icloud.com",
                                                        style: textStyle,
                                                      ),
                                                      onPressed: () {
                                                        provide.setMail(
                                                            "icloud.com");
                                                        setState(() {
                                                          _control2.text =
                                                              "icloud.com";
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: FlatButton(
                                                      child: Text(
                                                        "確定",
                                                        style: textStyle,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              onPressed: () {
                                if (provide.pre.isEmpty ||
                                    provide.mail.isEmpty) {
                                  showAlert.alert1("請輸入電子信箱", context);
                                } else {
                                  if (EmailValidator.validate(
                                      "${provide.pre}@${provide.mail}")) {
                                    provide.saveVerify1();
                                    provide.sendInfo();
                                    Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => Success(),
                                      ),
                                    );
                                  } else {
                                    showAlert.alert1("請檢查電子信箱格式", context);
                                  }
                                }
                              },
                              shape: btnStyle(
                                  color: Theme.of(context).primaryColor),
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                "完成",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.0),
                              child: Text("不定期提供專屬優惠，敬請正確填寫",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
