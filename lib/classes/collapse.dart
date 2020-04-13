import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Collapse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
          ),
          header: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.grey[200], Colors.white]),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                "ExpandablePanel",
                style: TextStyle(fontSize: 20.0),
              )),
          expanded: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "123",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "123",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
          hasIcon: false,
        ),
      ),
    );
  }
}
