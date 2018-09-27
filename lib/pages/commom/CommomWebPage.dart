import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CommomWebPage extends StatefulWidget {
  String title;
  String url;

  CommomWebPage(this.title, this.url, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new CommomWebPageState();
}

class CommomWebPageState extends State<CommomWebPage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  bool isLoading = true;

  StreamSubscription<WebViewStateChanged> _onStateChanged;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen(
      (WebViewStateChanged state) {
        switch (state.type) {
          case WebViewState.shouldStart:
            // 准备加载
            break;
          case WebViewState.startLoad:
            // 开始加载
            break;
          case WebViewState.finishLoad:
            // 加载完成
            setState(() {
              isLoading = false;
            });
            break;
        }
      },
    );

  }

  @override
  void dispose() {
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //获取当前state所属的widget
    var appBar = new AppBar(
      iconTheme: new IconThemeData(color: Colors.white),
      title: new Text(
        widget.title,
        style: TextStyle(color: Colors.white),
      ),
    );

    return new WebviewScaffold(
      url: widget.url,
      appBar: appBar,
      withJavascript: true,
      withLocalStorage: true,
      withLocalUrl: true,
      withZoom: true,
    );
  }
}
