import 'package:flutter/material.dart';
import './pages/homePage.dart';
import './data.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create:(context)=>Data(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: HomePage(),
      ),
    );
  }
}
/*
1. 設定page名稱來做navigator
2. 下載bottom navigator bar persist的package
3. 版本更新設定：利用api call抓version存至變數(if empty)，將此變數存在手機。每次開app比對此version與api call得到的version做比較。若不同可redirect至app store更新。此有redirect有package可下載)
4. 推播的badge：鎖定ios platform，利用偵測app是否被打開(in background和killed)並將此boolean(可設定兩個變數，one for background、one for killed)傳至後端來判斷badge數字是否需累加。in background再resume可以用lifecycle去偵測(widgetBindingObserver)
5. 推播方式可以選擇用api從後端推，彈性比較大，不要從firebase console推
*/