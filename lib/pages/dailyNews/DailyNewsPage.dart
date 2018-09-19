import 'package:flutter/material.dart';
import 'package:gank_io/api/HttpManager.dart';
import 'package:gank_io/api/Api.dart';

class DailyNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DailyNewsState();
}

class DailyNewsState extends State<DailyNewsPage> {


  @override
  void initState() {
    super.initState();
    HttpManager.post(Api.DAILY_NEWS).then((reslut){});
  }

  @override
  Widget build(BuildContext context) {}
}
