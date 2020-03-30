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
