import 'package:flutter/material.dart';
import 'package:gank_io/pages/GankMainPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gank.io',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlue,
        primaryColorDark: Colors.blue,
        accentColor: Colors.green,
      ),
      home: new GankMainPage(),
    );
  }
}
