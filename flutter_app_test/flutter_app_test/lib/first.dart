import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 8.0),
                child: new Image(
                  image: new AssetImage('images/logo.png'),
                  width: 43.0,
                  height: 43.0,
                )),
            new Text('Test'),
            new InputWidget(hint: '请输入账号'),
            new InputWidget(hint: '请输入密码'),
          ],
        ),
      ),
    );
  }
}

class InputWidget extends StatefulWidget {
  InputWidget({Key key, this.hint}) : super(key: key);

  final String hint;

  @override
  State<StatefulWidget> createState() => new _InputWidget();
}

class _InputWidget extends State<InputWidget> {
  String _errorText;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: new TextField(
        decoration:
            new InputDecoration(hintText: widget.hint, errorText: _errorText),
        onSubmitted: (String text) {
          setState(() {
            if (widget.hint.contains("手机号")) {
              if (isPhone(text)) {
                _errorText = null;
              } else {
                _errorText = 'Error: This is not an email';
              }
            }
          });
        },
      ),
    );
  }

  bool isPhone(String str) {
    String reg =
        '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$';
    RegExp regExp = new RegExp(reg);
    return regExp.hasMatch(str);
  }
}
