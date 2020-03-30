import 'package:flutter/material.dart';

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 120.0,
      color: Colors.grey[700].withOpacity(0.5),
      child: ListView(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "・",
              style:
              TextStyle(color: Colors.grey[200]),
            ),
            Expanded(
              child: Text(
                "配戴一般隱形眼鏡須經眼科醫師驗光配鏡取得處方籤，或經驗光人員驗光配鏡取得配鏡單，並定期接受眼科醫師追蹤檢查。",
                style: TextStyle(
                  color: Colors.grey[200],
                ),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "・",
              style:
              TextStyle(color:Colors.grey[200]),
            ),
            Expanded(
              child: Text(
                "本器材不得逾中文仿單建議之最長配戴時數、不得重複配戴，於就寢前務必取下，以免感染或潰瘍。",
                style: TextStyle(
                  color: Colors.grey[200],
                ),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "・",
              style:
              TextStyle(color: Colors.grey[200]),
            ),
            Expanded(
              child: Text(
                "如有不適，應立即就醫。",
                style: TextStyle(
                  color: Colors.grey[200],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
