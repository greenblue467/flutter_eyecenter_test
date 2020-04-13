import 'dart:async';
import 'package:eyecentertestapp/pages/product1Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/verify1.dart';
import './pages/newAccount.dart';
import './pages/howTo.dart';
import './pages/contact.dart';
import './classes/alert.dart';
import './classes/navigate.dart';

class Data with ChangeNotifier {
  bool hide=false;
  bool justLaunch = true;
  int index = 2;
  String deviceID;
  String cellphoneByMD5;
  String spCellphoneByMD5 = "spcellphoneByMD5";
  String phone;
  String spPhone = "spPhone";
  int time = 120;
  String verifyNumber;
  bool reSend = false;
  Timer _timer;
  bool verify1 = false;
  String spVerify1 = "spVerify1";
  Alert showAlert = Alert();
  String name;
  String year;
  String month;
  String day;
  String leftEye;
  String rightEye;
  String pre = "";
  String mail = "gmail.com";
  bool spin = false;
  List product1 = [];
  int product1Id;
  var product1Detail = {};
  List cart = [];
  String spCart = "spCart";
  List totalPriceList = [];
  String spTotalPriceList = "spTotalPriceList";
  var pointInfo;
  ScrollController controlScroll = ScrollController();

  void setControlScroll(){
    controlScroll.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  notifyListeners();
  }

  void setHide(val){
    hide=val;
    notifyListeners();
  }
  void setJustLaunch() {
    justLaunch = false;
    notifyListeners();
  }

  void setIndex(val) {
    index = val;
    notifyListeners();
  }

  void setDeviceID(val) {
    deviceID = val;
    notifyListeners();
  }


  void logInStatus(context) async {
    try {
      spin = true;
      var response = await http.get(
          "https://apiv2.eyeglasses.com.tw/AndroidLogin/LoginByCellphone?Cellphone=$phone%20&DeviceID=$deviceID");
      spin = false;
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse["AppAccount"]) {
          if (jsonResponse["ReturnValue"] == "locked") {
            showAlert.alert2("您的手機目前為鎖住狀態 ", "聯絡客服", Contact(), context, false);
          } else {
            countDown();
            verifyNumber = jsonResponse["ReturnValue"];
            cellphoneByMD5=jsonResponse["CellphoneByMD5"];
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return Verify1(
                  action: Navigate().pop,
                  setVerify: setVerity,
                  saveVerify: saveVerify1);
            }));
          }
        } else {
          if (jsonResponse["ReturnValue"] == "ERPMember") {
            showAlert.alert2("您已是大學眼鏡的「門市」會員，但尚未在本APP上註冊，請於下方建立帳號", "建立帳號",
                NewAccount(), context, false);
          } else if (jsonResponse["ReturnValue"] == "NotERPMember") {
            showAlert.alert2(
                "您尚未加入「門市」會員，無法登入APP", "如何成為門市會員", HowTo(), context, false);
          }
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
void setCellphoneByMD5(val){
    cellphoneByMD5=val;
    notifyListeners();
}
  void setTime() {
    time = 120;
    notifyListeners();
  }

  void timeDecrease() {
    time--;
    notifyListeners();
  }

  void reSendVal(val) {
    reSend = val;
    notifyListeners();
  }

  void sendAgain(context) async {
    try {
      spin = true;
      var response = await http.get(
          "https://apiv2.eyeglasses.com.tw/AndroidLogin/ResendRequest?Status=LoginResend&Cellphone=$phone");
      spin = false;
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse["ReturnValue"] == "locked") {
          showAlert.alert2("您的手機目前為鎖住狀態 ", "聯絡客服", Contact(), context, false);
        } else {
          verifyNumber = jsonResponse["ReturnValue"];
          countDown();
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void countDown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        timeDecrease();
      } else if (time == 0) {
        reSendVal(true);
        timer.cancel();
        setTime();
      }
    });
    notifyListeners();
  }

  void countCancel() {
    _timer.cancel();
  }

  void setVerity(val) {
    verify1 = val;
    notifyListeners();
  }

  void saveVerify1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    prefs.setBool(spVerify1, verify1);
    prefs.setString(spPhone, phone);
    prefs.setString(spCellphoneByMD5, cellphoneByMD5);
    notifyListeners();
  }

  void setPhone(num) {
    phone = num;
    notifyListeners();
  }

  void clearPhone() {
    phone = "";
    notifyListeners();
  }

  void register(context) async {
    try {
      spin = true;
      var response = await http.get(
          "https://apiv2.eyeglasses.com.tw/AndroidLogin/SignUpAccount?Cellphone=$phone");
      spin = false;
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse["ReturnValue"] == "AccountExist") {
          showAlert.alert3("此手機已註冊APP帳號，請返回登入頁面登入", "返回登入頁", context);
        } else if (jsonResponse["ReturnValue"] == "locked") {
          showAlert.alert2("您的手機目前為鎖住狀態 ", "聯絡客服", Contact(), context, true);
        } else if (jsonResponse["ReturnValue"] == "notERPMember") {
          showAlert.alert2(
              "您尚未加入「門市」會員，無法登入APP", "如何成為門市會員", HowTo(), context, true);
        } else {
          countDown();
          verifyNumber = jsonResponse["ReturnValue"];
          print(verifyNumber);
          name = jsonResponse["PersonData"]["Name"];
          var singleNumber = jsonResponse["PersonData"]["Birthday"].split("");
          year =
              "${singleNumber[0]}${singleNumber[1]}${singleNumber[2]}${singleNumber[3]}";
          month = "${singleNumber[5]}${singleNumber[6]}";
          day = "${singleNumber[8]}${singleNumber[9]}";
          leftEye = jsonResponse["PersonData"]["LeftDegree"];
          rightEye = jsonResponse["PersonData"]["RightDegree"];
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return Verify1(
              action: Navigate().push,
              setVerify: setVerity,
              saveVerify: nothing,
            );
          }));
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  void nothing() {
    print("nothing");
  }

  void setName(val) {
    name = val;
    notifyListeners();
  }

  void setYear(val) {
    year = val;
    notifyListeners();
  }

  void setMonth(val) {
    month = val;
    notifyListeners();
  }

  void setDay(val) {
    day = val;
    notifyListeners();
  }

  void setLeftEye(val) {
    leftEye = val;
    notifyListeners();
  }

  void setRightEye(val) {
    rightEye = val;
    notifyListeners();
  }

  void setPre(val) {
    pre = val;
    notifyListeners();
  }

  void setMail(val) {
    mail = val;
    notifyListeners();
  }

  void sendInfo() async {
    var body = {
      "Name": name,
      "Birthday": "$year-$month-$day",
      "LeftDegree": leftEye,
      "RightDegree": rightEye,
      "Email": "$pre@$mail",
      "DeviceID": deviceID
    };
    try {
      spin = true;
      await http.post(
        "https://apiv2.eyeglasses.com.tw/AndroidLogin/CreateAccount?Cellphone=$phone&Name=$name&Birthday=${int.parse(year)}-${int.parse(month)}-${int.parse(day)}&LeftDegree=$leftEye&RightDegree=$rightEye&Email=$pre@$mail&DeviceID=$deviceID",
        body: json.encode(body),
      );
      spin = false;
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  void setProduct1(val) {
    product1 = val;
    notifyListeners();
  }

  void setProduct1Id(val) {
    product1Id = val;
    notifyListeners();
  }

  void getProduct1Detail(context) async {
    try {
      var response = await http.get(
          "http://apiv2.eyeglasses.com.tw/Products/CL?BrandID=$product1Id");
      spin = false;
      if (response.statusCode == 200) {
        product1Detail = jsonDecode(response.body);
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => Product1Detail(),
          ),
        );
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void addToCart(name, pic, leftQ, rightQ, price, check, context) {
    Map item = {
      "Name": name,
      "Pic": pic,
      "LeftQ": leftQ,
      "RightQ": rightQ,
      "Price": price,
      "Check": check
    };
    cart.add(item);
    showAlert.alert1("已成功加入配送清單。請至「配送服務」進行配送！", context);
    notifyListeners();
  }
  void removeItem(item){
    cart.remove(item);
    notifyListeners();
  }

  void saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    prefs.setString(spCart, json.encode(cart));
    notifyListeners();
  }

  void setCart(val) {
    cart = val;
    notifyListeners();
  }

  void addTotalPriceList(val) {
    totalPriceList.add(val);
    notifyListeners();
  }
  void removeTotalPriceList(item){
    totalPriceList.remove(item);
    notifyListeners();
  }

  void setTotalPriceList(val) {
    totalPriceList = val;
    notifyListeners();
  }
  void saveTotalPriceList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        spTotalPriceList, json.encode(totalPriceList));
    notifyListeners();
  }
  void getPoint(page,context)async{
    try{
      var response=await http.get("http://apiv2.eyeglasses.com.tw/Member/MyBonus?cellphone=$cellphoneByMD5");
      spin=false;
      if(response.statusCode==200){
        pointInfo=jsonDecode(response.body);
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => page,
          ),
        );
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e);
    }
    notifyListeners();
  }
  void setSpin(val){
    spin=true;
    notifyListeners();
  }
}

//Log in:驗證成功後存phone及verify
//Register:驗證成功後存phone及verify並傳name、birth、leftEye、rightEye、email及CellphoneByMD5至後端
