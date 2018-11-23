import 'dart:async';

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SecondScreen')),
        body: new ListContentWidget());
  }
}

class ListContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ListContentWidget();
  }
}

class _ListContentWidget extends State<ListContentWidget> {
  bool _showProgress = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _showProgress = true;
      });
    });
  }

  @override
  void dispose() {
    if (null != timer) {
      timer.cancel();
      timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Stack(
        children: <Widget>[
          new Offstage(
            offstage: !_showProgress,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Second'),
                  new Text('Second'),
                ],
              ),
            ),
          ),
          new Offstage(
            offstage: _showProgress,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
