import 'package:flutter/material.dart';
import 'package:gank_io/pages/GankMainPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new GankMainPage(),
    );
  }
}
