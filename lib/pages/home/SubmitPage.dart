import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SubmitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SubmitPageState();
}

class SubmitPageState extends State<SubmitPage> {
  TextEditingController _controller = TextEditingController();
  static final List<String> categories = [
    'Android',
    'iOS',
    '前端',
    '瞎推荐',
    '休息视频',
    '拓展资源',
    '福利',
    'App'
  ];
  String selectCategory = categories[0];

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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: Text(
              '提交干货只需三步',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text(
            'Step0:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text('阅读优秀干货的定义：',
              style: TextStyle(
                fontSize: 18.0,
              )),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text('功能专一，文档完备，国际化，能加速开发的开源库或者框架',
              style: TextStyle(
                fontSize: 14.0,
              )),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text('新颖技术架构的完整 App 项目',
              style: TextStyle(
                fontSize: 14.0,
              )),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text('原创，深入浅出的文章（非简单入门）',
              style: TextStyle(
                fontSize: 14.0,
              )),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text('激发灵感的展示性项目',
              style: TextStyle(
                fontSize: 14.0,
              )),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text('// 只要满足以上一条或多条，均可被发表',
              style: TextStyle(fontSize: 14.0, color: Colors.green)),
          Padding(padding: const EdgeInsets.all(8.0)),
          Text(
            'Step1:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text('请对着神圣的PHP发誓，接下来提交的满足上述其一!',
              style: TextStyle(
                fontSize: 18.0,
              )),
          Padding(padding: const EdgeInsets.all(2.0)),
          Text('// 如果没有此圣物，请刷新页面',
              style: TextStyle(fontSize: 14.0, color: Colors.green)),
          Padding(padding: const EdgeInsets.all(8.0)),
          Text(
            'Step2:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Padding(padding: const EdgeInsets.all(8.0)),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text(
                        '分类:',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: selectCategory,
                        onChanged: (category) {
                          setState(() {
                            selectCategory = category;
                          });
                        },
                        items: categories
                            .map<DropdownMenuItem<String>>((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Text(
                        '地址:',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        maxLines: 1,
                        controller: _controller,
                        decoration: InputDecoration(hintText: '干货的URL地址'),
                      ),
                    ],
                  )),
            ],
          ),
          Padding(padding: const EdgeInsets.all(8.0)),
          Text(
            '描述:',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          Padding(padding: const EdgeInsets.all(2.0)),
          TextField(
            maxLines: 1,
            controller: _controller,
            decoration: InputDecoration(
                hintText: '不要超过这一行...太长会被人嫌弃，太短会过不了审核,最少15字',
                hintStyle: TextStyle(fontSize: 12.0)),
          ),
          Padding(padding: const EdgeInsets.all(8.0)),
          Text(
            'Step3:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Center(
            child: RaisedButton(
              child: SizedBox(
                width: 160.0,
                height: 40.0,
                child: Center(
                  child: Text('(๑´∀`๑)发射!'),
                ),
              ),
              onPressed: () {
                Fluttertoast.showToast(msg: 'QAQ该功能尚未开发完成');
              },
              color: Colors.lightBlue,
              textColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
