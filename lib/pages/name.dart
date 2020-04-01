import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import '../constValues.dart';
import '../classes/alert.dart';
import './birth.dart';

class Name extends StatelessWidget {
  final Alert showAlert=Alert();
  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context, listen: false);
    TextEditingController _control = TextEditingController(text: provide.name);
    _control.selection = TextSelection.fromPosition(TextPosition(offset: _control.text.length));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          margin: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              provide.setVerity(false);
              provide.countCancel();
              provide.setTime();
              Navigator.pop(context);
            },
            child: Text(
              "離開",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18.0),
            ),
          ),
        ),
      ),
      body:Container(
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 40.0),
              child: Text(
                "姓名",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark, fontSize: 30.0),
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
                            autofocus: true,
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                            decoration:
                            inputStyle(context: context, text: "請輸入姓名"),
                            controller: _control,
                            onChanged: (val) {
                              provide.setName(val);
                            },
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              if(provide.name.isEmpty){
                               showAlert.alert1("請輸入姓名", context);
                              }else{
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Birth()));
                              }
                            },
                            shape:
                            btnStyle(color: Theme.of(context).primaryColor),
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              "繼續",
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Text("請輸入正確姓名，以確保超商取件時的權益",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.0)),
                          )
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
    );
  }
}