import 'package:flutter/material.dart';
import 'package:gank_io/pages/commom/CommomWebPage.dart';

class LinkText extends StatefulWidget {
  String text;
  String url;
  Color color;

  LinkText(this.text, this.url, this.color, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LinkTextState();
}

class LinkTextState extends State<LinkText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        widget.text,
        style: TextStyle(
            color: widget.color, decoration: TextDecoration.underline),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CommomWebPage(widget.text, widget.url);
        }));
      },
    );
  }
}
