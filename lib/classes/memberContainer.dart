import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '../data.dart';

class MemberContainer extends StatelessWidget {
  final String text;
  final EdgeInsets direction;
  final IconData type;
  final Widget page;

  MemberContainer(this.text, this.direction, this.type, this.page);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context,listen: false).setSpin(true);
        Provider.of<Data>(context,listen: false).getPoint(page, context);
      },
      child: Container(
        margin: direction,
        child: Column(children: [
          Icon(
            type,
            size: 120.0,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18.0),
          )
        ]),
      ),
    );
  }
}
