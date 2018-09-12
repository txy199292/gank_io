import 'package:flutter/material.dart';
import 'package:gank_io/common/Resource.dart';

class GankMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _GankMainPageState();
}

class _GankMainPageState extends State<GankMainPage> {
  var _title = Resource.dailyTab;
  var _currentIndex = 0;
  PageController pageController;
  //底部tab控件list
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(Resource.dailyTab),
        backgroundColor: Colors.lightBlue),
    new BottomNavigationBarItem(
        icon: Icon(Icons.tune),
        title: Text(Resource.categoryTab),
        backgroundColor: Colors.lightBlue),
    new BottomNavigationBarItem(
        icon: Icon(Icons.image),
        title: Text(Resource.beautyTab),
        backgroundColor: Colors.lightBlue),
    new BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text(Resource.myTab),
        backgroundColor: Colors.lightBlue)
  ];

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: _currentIndex);
  }


  @override
  void dispose() {
    ///要在父类方法之前执行
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Text(_title),
          ),
        ),
        body: new PageView(
          controller: pageController,
          children: <Widget>[
            new Center(
              child: new Text(Resource.dailyTab),
            ),
            new Center(
              child: new Text(Resource.categoryTab),
            ),
            new Center(
              child: new Text(Resource.beautyTab),
            ),
            new Center(
              child: new Text(Resource.myTab),
            ),

          ],
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: _bottomTabs,
          currentIndex: _currentIndex,
          //默认 tab数量等于3 BottomNavigationBarType.fixed
          //否则BottomNavigationBarType.shifting
          type: BottomNavigationBarType.fixed,
          //点击改变底部tab选中状态
          onTap: (int index) {
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ));
  }

  ///底部tab改变调用该方法
  void _onPageChanged(int index) {
    setState(() {
      _title = (_bottomTabs[index].title as Title).title;
    });
  }
}
