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
6. MVM model，將data資料與UI分開，UI只是單純呈現view model給予的資訊。利用provider package來做管理，但若是像動畫類的只與UI有關(一般UI改變是因應裡面的資訊內容改變而變化，比較不會單純只改變例如長寬等UI，但是內容都一樣)，可放在local state，需要時再以constructor的方式pass
7. 設定若沒網路的情況(ex:出現某些訊息instead of running circularProcessIndicator。這邊用enum class蠻好用的)
8. be careful with ios launch img
* android release: 設定keystore新密碼打法 /Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/bin/keytool -storepasswd -新密碼 -keystore key.jks(key.jks為這個keystore創建時設的jks檔名)。若改了keystore密碼，key alias密碼也要跟著改成一樣/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/bin/keytool -keypasswd -alias key -new 新密碼 -keystore key.jks。查詢keystore打法為/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/bin/keytool -list -v -keystore key.jks

*/