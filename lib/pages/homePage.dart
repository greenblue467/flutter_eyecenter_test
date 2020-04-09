import 'dart:convert';
import 'package:eyecentertestapp/classes/menuItem.dart';
import 'package:eyecentertestapp/classes/menuItem2.dart';
import 'package:eyecentertestapp/pages/policy.dart';
import 'package:eyecentertestapp/pages/rules.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../widgets/login.dart';
import '../widgets/product.dart';
import '../widgets/shipping.dart';
import '../widgets/store.dart';
import '../widgets/member.dart';
import './pointPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'about.dart';
import 'contact.dart';
import 'faq.dart';
import 'laws.dart';
import '../widgets/news.dart';
import 'welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data.dart';
import 'package:device_info/device_info.dart';
import 'dart:io' show Platform;
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool firstLaunch = true;
  String spFirstLaunch = "spFirstLaunch";


  final memberContent = [
    News(),
    Member(),
    Product(),
    Store(),
    Shipping(),
  ];
  final content = [
    News(),
    Login(),
    Product(),
    Store(),
    Shipping(),
  ];

  getContents() {
    if (Provider.of<Data>(context, listen: false).verify1) {
      return IndexedStack(
          index: Provider.of<Data>(context).index, children: memberContent);
    } else {
      return IndexedStack(
          index: Provider.of<Data>(context).index, children: content);
    }
  }

  @override
  void initState() {
    super.initState();
    loadValues();
    getDeviceID();

  }

  void getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final provider = Provider.of<Data>(context, listen: false);
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        provider.setDeviceID(androidInfo.id);
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        provider.setDeviceID(iosInfo.identifierForVendor);
      }
    } catch (e) {
      print(e);
    }
  }

  void loadValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    final provider = Provider.of<Data>(context, listen: false);
    setState(() {
      if (prefs.getBool(spFirstLaunch) == null) {
        setState(() {
          firstLaunch = true;
        });
      } else {
        setState(() {
          firstLaunch = prefs.getBool(spFirstLaunch);
        });
      }
      if (prefs.getString(provider.spPhone) == null) {
        provider.setPhone("");
      } else {
        provider.setPhone(prefs.getString(provider.spPhone));
      }
      if (prefs.getString(provider.spCellphoneByMD5) == null) {
        provider.setCellphoneByMD5("");
      } else {
        provider.setCellphoneByMD5(prefs.getString(provider.spCellphoneByMD5));
      }
      if (prefs.getBool(provider.spVerify1) == null) {
        provider.setVerity(false);
      } else {
        provider.setVerity(prefs.getBool(provider.spVerify1));
      }
      if (prefs.getString(provider.spCart) == null) {
        provider.setCart([]);
      } else {
        provider.setCart(json.decode(prefs.getString(provider.spCart)));
      }
      if (prefs.getString(provider.spTotalPriceList) == null) {
        provider.setTotalPriceList([]);
      } else {
        provider.setTotalPriceList(
            json.decode(prefs.getString(provider.spTotalPriceList)));
      }
    });
    if (firstLaunch) {
      setState(() {
        firstLaunch = false;
      });
      provider.setIndex(1);
      prefs.setBool(spFirstLaunch, firstLaunch);
      Navigator.push(
          context,
          PageTransition(
              child: Welcome(),
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 100)));
    } else {
      if (provider.justLaunch) {
        Future.delayed(Duration.zero, () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    contentPadding: EdgeInsets.all(0.0),
                    elevation: 0.0,
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          height: 290.0,
                          width: 300.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/pic.jpg"),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -25.0,
                          right: -25.0,
                          child: FloatingActionButton(
                            elevation: 3.0,
                            child: Text(
                              "X",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      ],
                    ));
              });
        });
        provider.setJustLaunch();
      }
      provider.setIndex(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Data>(context, listen: false);
    return ModalProgressHUD(
      inAsyncCall: provide.spin,
      color: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "e 大學眼鏡",
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 22.0),
          ),
          elevation: 0.0,
        ),
        drawer: Drawer(
          elevation: 0.0,
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 20.0),
                        child: Text(
                          "e",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 80.0),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "大學眼鏡",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 25.0),
                            ),
                            Text(" Welcom Back!"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.only(top: 0.0),
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  "商品分類",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                                color: Theme.of(context).primaryColor,
                              ),
                              MenuItem(
                                text: "隱形眼鏡",
                                num1: 15.0,
                                num2: 15.0,
                                index: 2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  "服務專區",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                                color: Theme.of(context).primaryColor,
                              ),
                              MenuItem(text: "最新消息", num1: 15.0, index: 0),
                              MenuItem(
                                text: "會員中心",
                                index: 1,
                              ),
                              MenuItem(
                                text: "門市據點",
                                index: 3,
                              ),
                              MenuItem(
                                text: "配送服務",
                                num2: 15.0,
                                index: 4,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  "使用協議",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                                color: Theme.of(context).primaryColor,
                              ),
                              MenuItem2(
                                text: "關於大學",
                                num1: 15.0,
                                page: About(),
                              ),
                              MenuItem2(
                                text: "FAQ",
                                page: Faq(),
                              ),
                              MenuItem2(
                                text: "法律公告",
                                page: Laws(),
                              ),
                              MenuItem2(
                                text: "配送條款",
                                page: Rules(),
                              ),
                              MenuItem2(
                                text: "隱私權及使用條款",
                                page: Policy(),
                              ),
                              MenuItem2(
                                text: "聯絡我們",
                                num2: 15.0,
                                page: Contact(),
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
        body: getContents(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: Provider.of<Data>(context).index,
            onTap: (index) {
              if (provide.time < 120) {
                provide.countCancel();
                provide.setTime();
              }
              int originalIndex = provide.index;
              if (provide.verify1 && index == 0) {
                provide.setIndex(originalIndex);
                Navigator.push(
                    context,
                    PageTransition(
                        child: PointPage(), type: PageTransitionType.downToUp));

                return;
              } else if (!provide.verify1 && index == 0 ||
                  !provide.verify1 && index == 4) {
                provide.setIndex(1);
                Alert(
                  context: context,
                  title: "貼心小提醒",
                  desc: "請先登入會員",
                  closeFunction: () {},
                  buttons: [
                    DialogButton(
                      child: Text(
                        "取消",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ).show();
                return;
              }
              provide.setIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money, size: 40.0),
                  title: Text("使用點數")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people, size: 40.0), title: Text("會員中心")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list, size: 40.0),
                  title: Text(
                    "產品介紹",
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on, size: 40.0),
                  title: Text("門市據點")),
              BottomNavigationBarItem(
                  icon: Stack(overflow: Overflow.visible, children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Icon(
                        Icons.local_shipping,
                        size: 40.0,
                      ),
                    ),
                    provide.cart.isEmpty
                        ? Text("")
                        : Positioned(
                            right: -10.0,
                            child: Container(
                              height: 20.0,
                              width: 20.0,
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Center(
                                child: Text(
                                  Provider.of<Data>(context)
                                      .cart
                                      .length
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ]),
                  title: Text("配送服務")),
            ],
            selectedItemColor:
                provide.index == 0 ? Colors.white : Colors.lightGreenAccent,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).primaryColor),
      ),
    );
  }
}
