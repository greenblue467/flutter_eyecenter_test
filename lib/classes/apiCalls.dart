import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCalls {
  Future get(int val) async {
    try {
      var response = await http
          .get("https://apiv2.eyeglasses.com.tw/About/Get?APPInfoID=$val");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
