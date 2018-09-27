import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      ////创建透明层
      type: MaterialType.transparency,
      child: new Center(
          child: new SizedBox(
        //sizebox无界面  确定内部控件大小
        width: 120.0,
        height: 120.0,
        child: new Container(
          decoration: ShapeDecoration( //图形装饰器
              shape: new RoundedRectangleBorder( //圆角矩形边框
                  borderRadius: BorderRadius.all(
            new Radius.circular(8.0),
          ))),
          child: new Column(
            children: <Widget>[
              new CircularProgressIndicator(),
              new Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: new Text(
                  text,
                  style: new TextStyle(fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
