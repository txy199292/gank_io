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
  List<String> _categories  = new List();
  List<DailyNew> _dailyNews = new List();
  @override
  void initState() {
    super.initState();
    HttpManager.post(Api.DAILY_NEWS).then((resultData) {
      HttpResult result = json.decode(resultData.data);
      if(result!=null && !result.error){
        setState(() {
          _categories.clear();
          _categories.addAll(result.category);
          _dailyNews.clear();
          _dailyNews.addAll(result.results);

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

  }
}
