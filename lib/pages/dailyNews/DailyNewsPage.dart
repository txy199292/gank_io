import 'package:flutter/material.dart';
import 'package:gank_io/api/HttpManager.dart';
import 'package:gank_io/api/Api.dart';
import 'dart:convert';
import 'package:gank_io/model/HttpResult.dart';
import 'package:gank_io/model/DailyNew.dart';
import 'package:gank_io/Resource/Dimens.dart';

class DailyNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DailyNewsState();
}

class DailyNewsState extends State<DailyNewsPage> {
  List<String> _categories = new List();
  Map<String, List<DailyNew>> _dailyNews = new Map();
  @override
  void initState() {
    super.initState();
    HttpManager.get(Api.DAILY_NEWS).then((resultData) {
      HttpResult result = HttpResult.fromJson(resultData.data);
      if (result != null && !result.error) {
        setState(() {
          _categories.clear();
          _categories.addAll(result.category);
          _dailyNews.clear();
          _dailyNews.addAll(result.results);
        });
      }
    });
  }

  ListView getDailyList(List<DailyNew> dailyNews) {
    List<Widget> items = new List();
    dailyNews.forEach((dailyNew) {
      items.add(buildItem(dailyNew));
    });
    return new ListView(
      children: items,
    );
  }

  Widget buildItem(DailyNew dailyNew) {
    return new Card(
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: new InkWell(
        onTap: (){
          print('点击');
        },
        child: new Container(
          padding: EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: Dimens.textMargin,
                child: new Row(
                  children: <Widget>[
                    new Container(child: new Icon(Icons.timer),margin: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),),
                    new Expanded(child: new Text(dailyNew.publishedAt)),
                  ],
                ),
              ),
              new Container(
                margin: Dimens.textMargin,
                child: new Text(
                  dailyNew.desc,
                  textAlign: TextAlign.left,
                ),
              ),
              new Container(
                margin: Dimens.textMargin,
                child: new Row(
                  children: <Widget>[
                    new Text(
                      '作者:',
                      style: new TextStyle(color: Colors.grey),
                    ),
                    new Text(
                      dailyNew.who,
                      style: new TextStyle(color: Colors.lightBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
      });
      _dailyNews.forEach((key, value) {
        widgets.add(getDailyList(value));
      });

      return new DefaultTabController(
          length: _categories.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: TabBar(
                  tabs: tabs, isScrollable: true, labelColor: Colors.white),
            ),
            body: new TabBarView(children: widgets),
          ));
    }
    ;
  }
}
