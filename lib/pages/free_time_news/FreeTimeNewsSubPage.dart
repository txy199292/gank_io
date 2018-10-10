import 'package:flutter/material.dart';
import 'package:gank_io/api/HttpManager.dart';
import 'package:gank_io/api/Api.dart';
import 'package:gank_io/model/FreeTimeCategory.dart';
import 'package:gank_io/model/FreeTimeSubCategory.dart';
import 'package:gank_io/model/FreeTimeSubCategoryResult.dart';
import 'FreeTimeNewsList.dart';

class FreeTimeNewsSubPage extends StatefulWidget {
  FreeTimeCategory _category;

  FreeTimeNewsSubPage(this._category, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FreeTimeNewsSubPageState();
}

class FreeTimeNewsSubPageState extends State<FreeTimeNewsSubPage> {
  List<FreeTimeSubCategory> _subCategories = new List();
  List<Widget> _tabs = new List();
  List<Widget> _contents = new List();
  @override
  void initState() {
    super.initState();
    HttpManager.get(
            Api.FREE_TIME_NEWS_SUB_CATEGORY + '/${widget._category.en_name}')
        .then((data) {
      FreeTimeSubCategoryResult result =
          FreeTimeSubCategoryResult.fromJson(data.data);
      if (result.error == false && result.results != null) {
        setState(() {
          _subCategories.clear();
          _subCategories.addAll(result.results);
        });
      }
    });
  }

  List<Widget> getTabs() {
    _tabs.clear();
    _subCategories.forEach((subCategory) {
      _tabs.add(Tab(
          text: subCategory.title.contains('湾区日报') ? '湾区日报' : subCategory.title,
          icon: SizedBox(
            width: 24.0,
            height: 24.0,
            child: Image.network(subCategory.icon,fit: BoxFit.cover,),
          )));
    });
    return _tabs;
  }

  List<Widget> getContents() {
    _contents.clear();
    _subCategories.forEach((subCategory) {
      _contents.add(FreeTimeNewsList(subCategory));
    });
    return _contents;
  }

  @override
  Widget build(BuildContext context) {
    if (_subCategories.length == 0) {
      return Center(
        //圆形进度条
        child: CircularProgressIndicator(),
      );
    } else {
      return DefaultTabController(
          length: _subCategories.length,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              title: Title(
                  color: Colors.white,
                  child: Text(
                    widget._category.name,
                    style: TextStyle(color: Colors.white),
                  )),
              bottom: TabBar(
                  tabs: getTabs(),
                  isScrollable: true,
                  labelColor: Colors.white),
            ),
            body: TabBarView(children: getContents()),
          ));
    }
  }
}
