import 'package:flutter/material.dart';

class RowAndColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Row/Column布局详解')),
        body: new RowAndColumnWidget());
  }
}

class RowAndColumnWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RowAndColumnWidget();
  }
}

class _RowAndColumnWidget extends State<RowAndColumnWidget> {
  @override
  Widget build(BuildContext context) {
//    return Row(
//      children: <Widget>[
//        new Expanded(
//          child: Row(
//            textBaseline: TextBaseline.ideographic,
//            crossAxisAlignment: CrossAxisAlignment.baseline,
//            children: <Widget>[
//              Text(
//                '我',
//                style: TextStyle(
//                  fontSize: 30,
//                ),
//              ),
//              Text(
//                '小号',
//              ),
//              Text(
//                'AaA',
//                style: TextStyle(
//                  fontSize: 30,
//                ),
//              ),
//              Text(
//                'AaA',
//              ),
//            ],
//          ),
//          flex: 1,
//        ),
//        new Expanded(
//          child: Row(
//            textBaseline: TextBaseline.alphabetic,
//            crossAxisAlignment: CrossAxisAlignment.baseline,
//            children: <Widget>[
//              Text(
//                '我',
//                style: TextStyle(
//                  fontSize: 30,
//                ),
//              ),
//              Text(
//                '小号',
//              ),
//              Text(
//                'AaA',
//                style: TextStyle(
//                  fontSize: 30,
//                ),
//              ),
//              Text(
//                'AaA',
//              ),
//            ],
//          ),
//          flex: 1,
//        ),
//      ],
//    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text('MainAxisAlignment.spaceBetween-------->'),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new RaisedButton(
              onPressed: null,
              child: Text('Child1'),
            ),
            new RaisedButton(
              onPressed: null,
              child: Text('Child2'),
            ),
            new RaisedButton(
              onPressed: null,
              child: Text('Child3'),
            ),
          ],
        ),
        new Text('MainAxisAlignment.spaceAround-------->'),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new RaisedButton(
              onPressed: null,
              child: Text('Child1'),
            ),
            new RaisedButton(
              onPressed: null,
              child: Text('Child2'),
            ),
            new RaisedButton(
              onPressed: null,
              child: Text('Child3'),
            ),
          ],
        ),
        new Text('MainAxisAlignment.spaceEvenly-------->'),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              onPressed: null,
              child: Text('Child1'),
            ),
            new RaisedButton(
              onPressed: null,
              child: Text('Child2'),
            ),
            new RaisedButton(
              onPressed: null,
              child: Text('Child3'),
            ),
          ],
        ),
        //下面两个效果都是match_parent，猜测是最外层ListView的缘故
        new Text('MainAxisSize（max/min）-------->'),
        new Container(
          color: Colors.green,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(Icons.phone),
              Icon(Icons.phone_android),
              Icon(Icons.phone_iphone),
            ],
          ),
        ),
        new Container(
          color: Colors.red,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.phone),
              Icon(Icons.phone_android),
              Icon(Icons.phone_iphone),
            ],
          ),
        ),
        new Text('CrossAxisAlignment（center/stretch）-------->'),
        new Container(
          width: 200,
          height: 40,
          color: Colors.green,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.phone),
              Icon(Icons.phone_android),
              Icon(Icons.phone_iphone),
            ],
          ),
        ),
        new Container(
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.phone),
              Icon(Icons.phone_android),
            ],
          ),
        ),
        new Text('textDirection（ltr/rtl）-------->'),
        new Row(
          children: <Widget>[
            Icon(Icons.phone),
            Icon(Icons.phone_android),
            Icon(Icons.phone_iphone),
          ],
          textDirection: TextDirection.ltr,
        ),
        new Row(
          children: <Widget>[
            Icon(Icons.phone),
            Icon(Icons.phone_android),
            Icon(Icons.phone_iphone),
          ],
          textDirection: TextDirection.rtl,
        ),
        new Text('实现类似LinearLayout的weight权重效果-------->'),
        new Row(
          children: <Widget>[
            new Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  onPressed: null,
                  child: Text('1'),
                ),
              ),
              flex: 1,
            ),
            new Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: null,
                  child: Text('2'),
                ),
              ),
              flex: 2,
            ),
            new Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: null,
                  child: Text('3'),
                ),
              ),
              flex: 3,
            ),
          ],
        ),
        new Text('verticalDirection（up/down）-------->'),
        new Row(
          children: <Widget>[
            new Expanded(
              child: new Container(
                color: Colors.green,
                child: Column(
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Icon(Icons.phone),
                    Icon(Icons.phone_android),
                    Icon(Icons.phone_iphone),
                  ],
                ),
              ),
              flex: 1,
            ),
            new Expanded(
              child: new Container(
                color: Colors.red,
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    Icon(Icons.phone),
                    Icon(Icons.phone_android),
                    Icon(Icons.phone_iphone),
                  ],
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }
}
