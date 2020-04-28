import 'package:eyecentertestapp/classes/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ApiCalls {
  Future get(int val,context) async {
    try {
      var response = await http
          .get("https://apiv2.eyeglasses.com.tw/About/Get?APPInfoID=$val");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    }on SocketException{
      Alert().alert1("No Internet", context);
      throw Exception("No Internet");
    } on HttpException{
      Alert().alert1("Page Not Found", context);
      throw Exception("Page Not Found");
    } on FormatException{
      Alert().alert1("Error Format", context);
      throw Exception("Error Format");
    }catch (e) {
      Alert().alert1(e.message, context);
      throw Exception("Error");
    }
  }
}

