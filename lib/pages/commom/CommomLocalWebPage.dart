import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:path_provider/path_provider.dart';

class CommomLocalWebPage extends StatefulWidget {
  String title;
  String content;


  CommomLocalWebPage(this.title, this.content, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new CommomLocalWebPageState();
}

class CommomLocalWebPageState extends State<CommomLocalWebPage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  bool isLoading = true;
  String localUrl;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  File localHtml;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen(
      (WebViewStateChanged state) {
        switch (state.type) {
          case WebViewState.shouldStart:
            // 准备加载  可以考虑下showdialog

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
    dealLocalHtml();
  }

  void dealLocalHtml() async{
    Directory tempDir = await getTemporaryDirectory();
    localHtml = File('${tempDir.path}/temp.html');
    localHtml.exists().then((isExists){
      if(isExists){
        localHtml.delete();
        localHtml.create();
        localHtml.writeAsString(widget.content).then((file){
          setState(() {
            localUrl = file.path;
          });
        });
      }else{
        localHtml.create();
        localHtml.writeAsString(widget.content).then((file){
          setState(() {
            localUrl = file.path;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    //界面销毁时取消监听
    //_onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //获取当前state所属的widget
    var appBar = AppBar(
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: IconThemeData(color: Colors.white),
    );

    return WebviewScaffold(
      url: localUrl,
      appBar: appBar,
      withJavascript: true,
      withLocalStorage: true,
      withLocalUrl: true,
      withZoom: true,
    );
  }
}
