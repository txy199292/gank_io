import 'package:flutter/material.dart';
import 'package:gank_io/pages/commom/GankMainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gank.io',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlue,
        primaryColorDark: Colors.blue,
        accentColor: Colors.green,
      ),
      home: GankMainPage(),
    );
  }
}
