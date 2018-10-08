import 'package:flutter/material.dart';
import 'package:gank_io/model/FreeTimeCategory.dart';
import 'package:gank_io/model/FreeTimeSubCategory.dart';
import 'package:gank_io/model/FreeTimeItemResult.dart';
import 'package:gank_io/model/FreeTimeItem.dart';
import 'package:gank_io/api/Api.dart';
import 'package:gank_io/api/HttpManager.dart';


class FreeTimeNewsList extends StatefulWidget{
  FreeTimeCategory _category;
  FreeTimeSubCategory _subCategory;


  FreeTimeNewsList(this._category, this._subCategory,{Key key}):super(key:key);

  @override
  State<StatefulWidget> createState()=>FreeTimeNewsListState();
}

class FreeTimeNewsListState extends State<FreeTimeNewsList>{
  int _page = 1;
  static final int _pageSize = 10;
  List<FreeTimeItem> _items = List();
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //最大可滑动距离
      var maxScroll = _controller.position.maxScrollExtent;
      //当前距离
      var pixels = _controller.position.pixels;
      //滑动到底部
      if (maxScroll == pixels) {
        _page++;
        _getItems();
      }
    });
    _getItems();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _getItems() {
    HttpManager.get(Api.FREE_TIME_NEWS_ITEMS + '/id/${widget._subCategory.id}/count/${_pageSize}/page/${_page}').then((resultData) {
      FreeTimeItemResult result = FreeTimeItemResult.fromJson(resultData.data);
      if (result != null && !result.error) {
        setState(() {
          if (_page == 1) {
            _items.clear();
          }
          _items.addAll(result.results);
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {

  }

}