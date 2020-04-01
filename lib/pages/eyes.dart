import 'package:flutter/cupertino.dart';
import '../data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constValues.dart';
import '../classes/degreeText.dart';
import './email.dart';

class Eyes extends StatelessWidget {
  final List degreeList = degree.map((val) => DegreeText(val)).toList();
  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context, listen: false);
    int initialLeft=degree.indexOf(provide.leftEye);
    int initialRight=degree.indexOf(provide.rightEye);
    TextEditingController _controlL = TextEditingController(
        text: provide.leftEye.isEmpty
            ? "未驗光"
            : Provider.of<Data>(context).leftEye);
    TextEditingController _controlR = TextEditingController(
        text: provide.rightEye.isEmpty
            ? "未驗光"
            : Provider.of<Data>(context).rightEye);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  margin: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    "左眼",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 30.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  margin: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    "右眼",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 30.0),
                  ),
                ),
              ],
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
                                    readOnly: true,
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 15.0,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                    controller: _controlL,
                                    onChanged: (val) {},
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    readOnly: true,
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 15.0,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                    controller: _controlR,
                                    onChanged: (val) {},
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
                              Navigator.push(context, CupertinoPageRoute(builder:(context)=>Email(),),);
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
                            child: Text(
                                provide.leftEye.isEmpty
                                    ? "請先按「繼續」進入下一步。至門市驗光後，方可享有完整的配送服務"
                                    : "請確認您的度數，設定後如需變更請洽門市人員",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.0)),
                          ),
                        ],
                      ),
                    ),
                    provide.leftEye.isEmpty?Container():Container(
                      color: Colors.grey[50],
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 30.0),
                            width: MediaQuery.of(context).size.width / 2,
                            height: 300.0,
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(initialItem:initialLeft ),
                              backgroundColor: Colors.grey[50],
                              itemExtent: 30.0,
                              children: degreeList,
                              onSelectedItemChanged: (index) {
                                provide.setLeftEye(degreeList[index].text);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 30.0),
                            width: MediaQuery.of(context).size.width / 2,
                            height: 300.0,
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(initialItem:initialRight ),
                              backgroundColor: Colors.grey[50],
                              itemExtent: 30.0,
                              children: degreeList,
                              onSelectedItemChanged: (index) {
                                provide.setRightEye(degreeList[index].text);
                              },
                            ),
                          )
                        ],
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
