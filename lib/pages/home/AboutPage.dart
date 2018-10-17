import 'package:flutter/material.dart';
import 'package:gank_io/widget/LinkText.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Title(
              color: Colors.white,
              child: Text(
                '关于应用',
                style: TextStyle(color: Colors.white),
              )),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('images/ic_launcher.png',
                      width: 60.0, height: 60.0),
                  Padding(padding: const EdgeInsets.all(8.0)),
                  Text(
                    'Gank.io Flutter客户端',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text('本项目地址:\n'),
              Padding(padding: const EdgeInsets.all(8.0)),
              LinkText('https://github.com/txy199292/gank_io',
                  'https://github.com/txy199292/gank_io', Colors.green),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(
                  '本应用为Flutter版本Gank.io客户端，应供个人学习交流之用。\n\n特别感谢Gank.io为本应用提供Api:\n'),
              LinkText('https://gank.io/', 'https://gank.io/', Colors.green),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text('本应用主要参考了以下两位大佬的部分代码:'),
              Padding(padding: const EdgeInsets.all(8.0)),
              LinkText(
                  'https://github.com/CarGuo/GSYGithubAppFlutter',
                  'https://github.com/CarGuo/GSYGithubAppFlutter',
                  Colors.green),
              Padding(padding: const EdgeInsets.all(8.0)),
              LinkText('https://github.com/ZQ330093887/GankFlutter',
                  'https://github.com/ZQ330093887/GankFlutter', Colors.green),
            ],
          ),
        ));
  }
}
