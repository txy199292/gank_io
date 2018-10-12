import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gank_io/pages/home/AboutPage.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String userAvatar;
  String userName;
  var commomItems = [
    Item('我的设置', Icons.settings),
    Item('提交干货', Icons.cloud_upload),
    Item('项目地址', Icons.computer),
    Item('关于应用', Icons.toys),
    Item('退出应用', Icons.exit_to_app)
  ];
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        userAvatar = image.path;
      });
    }

    var header = Container(
      color: Colors.lightBlue,
      child: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: SizedBox(
                width: 70.0,
                height: 70.0,
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  backgroundImage: userAvatar == null
                      ? AssetImage('images/header.jpg')
                      : AssetImage(userAvatar),
                ),
              ),
              onTap: () {
                getImage();
              },
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    userName == null ? "点击设置昵称" : userName,
                    style: new TextStyle(color: Colors.white, fontSize: 16.0),
                    maxLines: 1,
                  ),
                  Padding(padding: const EdgeInsets.all(2.0)),
                  Icon(
                    Icons.create,
                    color: Colors.white,
                  )
                ],
              ),
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return new AlertDialog(
                        title: Center(
                          child: Text(
                            '设置昵称',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        content: TextField(
                          maxLines: 2,
                          maxLength: 20,
                          controller: _textController,
                          decoration: InputDecoration(
                              hintText: '请输入昵称',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)))),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('取消')),
                          new FlatButton(
                              onPressed: () {
                                setState(() {
                                  userName = _textController.text;
                                });
                                _textController.clear();
                                Navigator.of(context).pop();
                              },
                              child: new Text('确定'))
                        ],
                      );
                    });
              },
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
          ],
        ),
      ),
    );

    List<Widget> getItems() {
      List<Widget> items = List();
      items.add(header);

      commomItems.forEach((item) {
        items.add(Divider(
          height: 1.0,
        ));

        items.add(InkWell(
          child: ListTile(
            leading: Icon(item.icon, color: Colors.lightBlue),
            title: Text(item.title),
            trailing: Icon(
              Icons.keyboard_arrow_right,
            ),
            onTap: () {
              switch (item.title) {
                case '我的设置':
                  break;
                case '提交干货':
                  break;
                case '项目地址':
                  break;
                case '关于应用':
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutPage();
                  }));
                  break;
                case '退出应用':
                  exit(0);
                  break;
              }
            },
          ),
        ));
      });

      items.add(Divider(
        height: 1.0,
      ));
      return items;
    }

    return ListView(
      children: getItems(),
    );
  }
}

class Item {
  String title;
  IconData icon;

  Item(this.title, this.icon);
}
