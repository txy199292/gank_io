import 'package:flutter/material.dart';
import 'package:gank_io/api/HttpManager.dart';
import 'package:gank_io/api/Api.dart';
import 'package:gank_io/model/HttpResult.dart';
import 'package:gank_io/model/Post.dart';
import 'package:gank_io/Resource/Dimens.dart';
import 'package:gank_io/pages/commom/CommomWebPage.dart';

class DailyNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DailyNewsState();
}

class DailyNewsState extends State<DailyNewsPage> {
  List<String> _categories =  List();
  Map<String, List<Post>> _dailyNews = new Map();
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

  ListView _getDailyList(List<Post> dailyNews) {
    List<Widget> items =  List();
    dailyNews.forEach((dailyNew) {
      items.add(_buildItem(dailyNew));
    });
    return  ListView(
      children: items,
    );
  }

  Widget _buildItem(Post dailyNew) {
    return  Card(
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child:  InkWell(
        onTap: (){
          Navigator.of(context).push( MaterialPageRoute(builder: (context){
            return  CommomWebPage(dailyNew.desc, dailyNew.url);
          }));
        },
        child:  Container(
          padding: EdgeInsets.all(8.0),
          child:  Row(
            children: <Widget>[
               Expanded(child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Container(
                    margin: Dimens.textMargin,
                    child:  Row(
                      children: <Widget>[
                         Container(child: new Icon(Icons.timer),margin: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),),
                         Expanded(child: new Text(_getTimeStr(dailyNew.publishedAt))),
                      ],
                    ),
                  ),
                   Container(
                    margin: Dimens.textMargin,
                    child:  Text(
                      dailyNew.desc,
                      textAlign: TextAlign.left,
                    ),
                  ),
                   Container(
                    margin: Dimens.textMargin,
                    child:  Row(
                      children: <Widget>[
                         Text(
                          '作者:',
                          style:  TextStyle(color: Colors.grey),
                        ),
                         Text(
                          dailyNew.who,
                          style:  TextStyle(color: Colors.lightBlue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ),
              //注意 Image控件 当url为空时 不会显示  大小为0
               Image.network((dailyNew.images == null || dailyNew.images.length == 0)?'':dailyNew.images[0],width: 80.0,height: 80.0,)
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
      return  Center(
        //圆形进度条
        child:  CircularProgressIndicator(),
      );
    } else {
      List<Tab> tabs =  List();
      List<Widget> widgets =  List();
      _categories.forEach((category) {
        tabs.add( Tab(text: category));
      });
      _dailyNews.forEach((key, value) {
        widgets.add(_getDailyList(value));
      });

      return  DefaultTabController(
          length: _categories.length,
          child:  Scaffold(
            appBar:  AppBar(
              title: TabBar(
                  tabs: tabs, isScrollable: true, labelColor: Colors.white),
            ),
            body:  TabBarView(children: widgets),
          ));
    }
    ;
  }
}
