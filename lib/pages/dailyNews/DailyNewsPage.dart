import 'package:flutter/material.dart';
import 'package:gank_io/api/HttpManager.dart';
import 'package:gank_io/api/Api.dart';
import 'package:gank_io/model/HttpResult.dart';
import 'package:gank_io/model/DailyNew.dart';
import 'package:gank_io/Resource/Dimens.dart';
import 'package:gank_io/pages/commom/CommomWebPage.dart';

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

  ListView _getDailyList(List<DailyNew> dailyNews) {
    List<Widget> items = new List();
    dailyNews.forEach((dailyNew) {
      items.add(_buildItem(dailyNew));
    });
    return new ListView(
      children: items,
    );
  }

  Widget _buildItem(DailyNew dailyNew) {
    return new Card(
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: new InkWell(
        onTap: (){
          Navigator.of(context).push(new MaterialPageRoute(builder: (context){
            return new CommomWebPage(dailyNew.desc, dailyNew.url);
          }));
        },
        child: new Container(
          padding: EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              new Expanded(child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: Dimens.textMargin,
                    child: new Row(
                      children: <Widget>[
                        new Container(child: new Icon(Icons.timer),margin: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),),
                        new Expanded(child: new Text(_getTimeStr(dailyNew.publishedAt))),
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
              //注意 Image控件 当url为空时 不会显示  大小为0
              new Image.network((dailyNew.images == null || dailyNew.images.length == 0)?'':dailyNew.images[0],width: 80.0,height: 80.0,)
            ],
          )
        ),
      ),
    );
  }

  String _getTimeStr(String str){
    DateTime dateTime =  DateTime.parse(str);
    return '${dateTime.year}年${dateTime.month}月${dateTime.day}日' ;
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
        widgets.add(_getDailyList(value));
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
