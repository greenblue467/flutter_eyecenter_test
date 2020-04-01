import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import '../constValues.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import './eyes.dart';

class Birth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context, listen: false);
    TextEditingController _control = TextEditingController(
        text: "${Provider.of<Data>(context).year}-${Provider.of<Data>(context).month}-${Provider.of<Data>(context).day}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                "生日",
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
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextField(
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                            showCursor: false,
                            readOnly: true,
                            decoration: inputStyle(context: context, text: ""),
                            controller: _control,
                            onChanged: (val) {},
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => Eyes()));
                            },
                            shape:
                                btnStyle(color: Theme.of(context).primaryColor),
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              "繼續",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Text("會員享有生日專屬優惠，敬請正確填寫",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.0)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey[50],
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: DatePickerWidget(
                        maxDateTime: DateTime.now(),
                        pickerTheme: DateTimePickerTheme(
                            backgroundColor: Colors.grey[50],
                            showTitle: false,
                            pickerHeight: 300.0,
                            itemTextStyle: TextStyle(fontSize: 20.0)),
                        locale: DateTimePickerLocale.zh_cn,
                        dateFormat: "yyyy年-MM月-dd日",
                        initialDateTime: DateTime(
                            int.parse(provide.year), int.parse(provide.month), int.parse(provide.day)),
                        onChange: (date, index) {
                          provide.setYear(date.year.toString());
                          provide.setMonth(date.month.toString());
                          provide.setDay(date.day.toString());
                        },
                      ),
                    )
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
