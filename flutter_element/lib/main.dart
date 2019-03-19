import 'package:flutter/material.dart';
import 'package:flutter_element/animator_element.dart';
import 'package:flutter_element/edit_text_element.dart';
import 'package:flutter_element/image_element.dart';
import 'package:flutter_element/login_page.dart';
import 'package:flutter_element/row_column.dart';
import 'package:flutter_element/text_element.dart';
import 'package:flutter_element/toast_manager.dart';
import 'package:flutter_element/video_element.dart';
import 'package:flutter_element/view_pager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showBottomDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.black,
            height: 350.0,
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                child: new Center(
              child: new Text("This is a modal sheet"),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => TextElement()));
                  _showBottomDialog(context);
                },
                child: Text('Text组件详解'),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ImageElement()));
                },
                child: Text('Image组件详解'),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTextElement()));
                },
                child: Text('TextFiled组件详解'),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RowAndColumn()));
                },
                child: Text('Row/Column布局详解'),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VideoElement()));
                },
                child: Text('视频播放'),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewPagerElement()));
                },
                child: Text('ViewPager'),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimatorElement()));
                },
                child: Text('动画'),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('登录动画'),
              ),
            ],
          ),
        ));
  }
}
