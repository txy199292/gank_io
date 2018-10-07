import 'package:flutter/material.dart';
import 'package:gank_io/api/HttpManager.dart';
import 'package:gank_io/api/Api.dart';
import 'package:gank_io/model/FreeTimeCategory.dart';
import 'package:gank_io/model/FreeTimeCategoryResult.dart';

class FreeTimeNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FreeTimeNewsPageState();
}

class FreeTimeNewsPageState extends State<FreeTimeNewsPage> {
  List<FreeTimeCategory> _categories = List();

  @override
  void initState() {
    super.initState();
    HttpManager.get(Api.FREE_TIME_NEWS_CATEGORY).then((result) {
      FreeTimeCategoryResult categoryResult =
          FreeTimeCategoryResult.fromJson(result.data);
      if (categoryResult != null && !categoryResult.error) {
        setState(() {
          _categories.addAll(categoryResult.results);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildItem(FreeTimeCategory category) {
      return SizedBox(width: 200.0,height: 140.0,child: Card(
          elevation: 8.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            splashColor: Colors.blue,
            onTap: (){
              print('点击');
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Image.network(
                  'https://img.ithome.com/newsuploadfiles/2018/9/20180911120414_3852.jpg',),
                Center(child: Text(
                  category.name,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),)
              ],
            ),
          )),);
    }

    if (_categories.length == 0) {
      return Center(
        //圆形进度条
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          body: ListView.builder(
        itemBuilder: (context, position) {
          return _buildItem(_categories[position]);
        },
        itemCount: _categories.length,
      ));
    }
  }
}
