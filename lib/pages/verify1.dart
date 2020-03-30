import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class Verify1 extends StatefulWidget {

  final Function action;
  final Function setVerify;
  final Function saveVerify;
  Verify1({this.action,this.setVerify,this.saveVerify});
  @override
  _Verify1State createState() => _Verify1State();
}

class _Verify1State extends State<Verify1> {
  TextEditingController textControl = TextEditingController();
  bool _fail = false;
  FocusNode myFocus = FocusNode();

  String durationToString(int seconds) {
    var d = Duration(minutes: seconds);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context, listen: false);
    return ModalProgressHUD(
      inAsyncCall: provide.spin,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
                child: Text(
                  "請輸入驗證碼",
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 300.0,
                child: PinCodeTextField(
                  focusNode: myFocus,
                  textInputAction: TextInputAction.next,
                  activeColor: _fail
                      ? Colors.red
                      : provide.verify1
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                  inactiveColor: Colors.grey,
                  selectedColor: Theme.of(context).primaryColor,
                  textInputType: TextInputType.numberWithOptions(),
                  length: 5,
                  obsecureText: false,
                  autoFocus: true,
                  animationType: AnimationType.fade,
                  shape: PinCodeFieldShape.box,
                  animationDuration: Duration(milliseconds: 100),
                  borderRadius: BorderRadius.circular(10.0),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  textStyle: TextStyle(fontSize: 25.0),
                  controller: textControl,
                  onCompleted: (value) {
                    Future.delayed(
                        Duration(seconds: 3), () => textControl.clear());
                  },
                  onChanged: (value) {
                    if (value.length < 5) {
                      setState(() {
                        _fail = false;
                      });
                    } else if (value.length == 5 &&
                        value == provide.verifyNumber) {
                      widget.setVerify(true);
                      widget.saveVerify();
                      provide.countCancel();
                      provide.setTime();
                      setState(() {
                        _fail = false;
                      });
                      Future.delayed(Duration(seconds: 3), () {
                       widget.action(context);
                      });
                    } else if (value.length == 5 &&
                        value != provide.verifyNumber) {
                      Future.delayed(Duration(seconds: 3),
                          () => FocusScope.of(context).requestFocus(myFocus));
                      setState(() {
                        _fail = true;
                      });
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(
                  _fail ? "您輸入的驗證碼有誤，請重新輸入～" : "驗證成功！",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: _fail
                          ? Colors.red
                          : provide.verify1
                              ? Theme.of(context).primaryColor
                              : Colors.transparent),
                ),
              ),
              provide.reSend
                  ? GestureDetector(
                      onTap: () {
                        provide.reSendVal(false);
                        provide.sendAgain(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                        child: Text(
                          "還沒收到？再發送一次",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                      child: Text(
                        "重新寄送驗證碼：${durationToString(Provider.of<Data>(context).time)}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
              Container(
                child: Text(
                  "驗證碼已用簡訊發送至${Provider.of<Data>(context).phone}",
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
