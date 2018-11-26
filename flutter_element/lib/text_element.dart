import 'package:flutter/material.dart';

class TextElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Text组件详解')), body: new TextViewWidget());
  }
}

class TextViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextViewWidget();
  }
}

class _TextViewWidget extends State<TextViewWidget> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Text('什么也不设置'),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            '设置换行设置换行设置换行设置换行设置换行设置换行设置换行设置换行设置换行设置换行设置换行',
            //是否自动换行 false文字不考虑容器大小，单行显示，超出屏幕部分将默认截断处理
            softWrap: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            '设置超出屏幕之后的显示规则设置超出屏幕之后的显示规则设置超出屏幕之后的显示规则设置超出屏幕之后的显示规则',
            //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            '设置最大显示行数设置最大显示行数设置最大显示行数设置最大显示行数设置最大显示行数设置最大显示行数设置最大显示行数',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            '文本方向 sasasasasasasasasasasasasasasasasasasasasasa bdbdbdbdbdbdbdbdbdbdbdb',
            //TextDirection.ltr从左至右，TextDirection.rtl从右至左
            textDirection: TextDirection.rtl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            '文本对齐方式 sasasasasasasasasasasasasasasasasasasasasasa bdbdbdbdbdbdbdbdbdbdbdb',
            //TextAlign.left左对齐，TextAlign.right右对齐，TextAlign.center居中对齐，TextAlign.justfy两端对齐
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            '设置颜色和大小',
            style: TextStyle(
              color: const Color(0xfff2c2b2),
              fontSize: 17,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            '设置粗细和斜体',
            style: TextStyle(
              //字体粗细，粗体和正常
              fontWeight: FontWeight.bold,
              //文字样式，斜体和正常
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            '设置文字装饰',
            style: TextStyle(
              //none无文字装饰，lineThrough删除线，overline文字上面显示线，underline文字下面显示线
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            '单词间隙 hello world i am jack',
            style: TextStyle(
              wordSpacing: 10.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            '字母间隙 hello world',
            style: TextStyle(
              letterSpacing: 10.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: GestureDetector(
            onTap: () {
              print("点击了按钮");
            },
            child: Text(
              '设置文字点击事件',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Text.rich(
            new TextSpan(
                text: 'Text.rich',
                style: new TextStyle(
                    color: Colors.yellow,
                    fontSize: 13,
                    decoration: TextDecoration.none),
                children: <TextSpan>[
                  new TextSpan(
                      text: '拼接1',
                      style: new TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          decoration: TextDecoration.none)),
                  new TextSpan(
                      text: '拼接2',
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          decoration: TextDecoration.none)),
                  new TextSpan(
                      text: '拼接3',
                      style: new TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          decoration: TextDecoration.none)),
                  new TextSpan(
                      text: '拼接4',
                      style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          decoration: TextDecoration.none)),
                ]),
          ),
        )
      ],
    );
  }
}
