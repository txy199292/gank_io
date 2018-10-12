import 'package:flutter/material.dart';
import 'package:gank_io/model/FreeTimeSubCategory.dart';
import 'package:gank_io/model/FreeTimeItemResult.dart';
import 'package:gank_io/model/FreeTimeItem.dart';
import 'package:gank_io/api/Api.dart';
import 'package:gank_io/api/HttpManager.dart';
import 'package:gank_io/pages/commom/CommomWebPage.dart';

class FreeTimeNewsList extends StatefulWidget {
  FreeTimeSubCategory _subCategory;

  FreeTimeNewsList(this._subCategory, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FreeTimeNewsListState();
}

class FreeTimeNewsListState extends State<FreeTimeNewsList> {
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
    HttpManager.get(Api.FREE_TIME_NEWS_ITEMS +
            '/id/${widget._subCategory.id}/count/${_pageSize}/page/${_page}')
        .then((resultData) {
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
    String _getTimeStr(String str) {
      DateTime dateTime = DateTime.parse(str);
      return '${dateTime.year}年${dateTime.month}月${dateTime.day}日';
    }

    Widget _buildItem(int position) {
      FreeTimeItem item = _items[position];
      return Card(
          elevation: 2.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          margin: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CommomWebPage(item.title, item.url);
              }));
            },
            child: Row(
              children: <Widget>[
                SizedBox(
                    width: 180.0,
                    height: 120.0,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(child: Text(item.title, maxLines: 3)),
                          Text(
                            _getTimeStr(item.published_at),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    child: Image.network(
                  (item.cover == null || item.cover == "none")
                      ? "http://img.zcool.cn/community/010ad7575faad10000012e7e0be5bb.gif"
                      : item.cover,
                  height: 120.0,
                  fit: BoxFit.fill,
                ))
              ],
            ),
          ));
    }

    Future<Null> _pullToRefresh() async {
      _page = 1;
      _getItems();
      return null;
    }

    return RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, position) {
            return _buildItem(position);
          },
          controller: _controller,
          itemCount: _items.length,
        ),
        onRefresh: _pullToRefresh);
  }
}
