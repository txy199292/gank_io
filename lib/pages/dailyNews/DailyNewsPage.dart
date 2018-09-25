import 'package:flutter/material.dart';
import 'package:gank_io/api/HttpManager.dart';
import 'package:gank_io/api/Api.dart';
import 'dart:convert';
import 'package:gank_io/model/HttpResult.dart';
import 'package:gank_io/model/DailyNew.dart';

class DailyNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DailyNewsState();
}

class DailyNewsState extends State<DailyNewsPage> {
  List<String> _categories = new List();
  List<DailyNew> _dailyNews = new List();
  @override
  void initState() {
    super.initState();
    HttpManager.get(Api.DAILY_NEWS).then((resultData) {
      try{
      HttpResult result = json.decode(resultData.data);
      if (result != null && !result.error) {
        setState(() {
          _categories.clear();
          _categories.addAll(result.category);
          _dailyNews.clear();
        });
      }
    }catch(e){
     String error =  e.toString();
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_categories.length == 0) {
      return new Center(
        //圆形进度条
        child: new CircularProgressIndicator(),
      );
    } else {
      List<Tab> tabs = new List();
      List<Widget> widgets = new List();
      _categories.forEach((category) {
        tabs.add(new Tab(text: category));
        widgets.add(new Container(
          child: new Text(category),
        ));
      });

      return new DefaultTabController(
          length: null,
          child: new Scaffold(
            appBar: new AppBar(
              bottom: TabBar(tabs: tabs),
            ),
            body: new TabBarView(children: widgets),
          ));
    }
    ;
  }
}
