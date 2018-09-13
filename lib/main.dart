import 'package:flutter/material.dart';
import 'package:gank_io/pages/GankMainPage.dart';
import 'package:gank_io/api/Api.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Api.post("", onProgress:(){},(result){

    }, (error){

    });
    return new MaterialApp(
      title: 'Gank.io',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlue,
        primaryColorDark: Colors.blue,
        accentColor:Colors.green,
      ),
      home: new GankMainPage(),
    );
  }


}
