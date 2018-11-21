import 'package:flutter/material.dart';
import 'package:flutter_toast/flutter_toast.dart';

class FirstScreen extends StatelessWidget {
  //手机号的控制器
  final TextEditingController phoneController = TextEditingController();

  //密码的控制器
  final TextEditingController passController = TextEditingController();

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
            new InputWidget(
              hint: '请输入账号',
              passController: passController,
              phoneController: phoneController,
            ),
            new InputWidget(hint: '请输入密码'),
            new Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
              child: new RaisedButton(
                onPressed: () => _login(context),
                textTheme: ButtonTextTheme.accent,
                child: Text('登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    if (phoneController.text.length < 11) {
      FlutterToast.showShortToast('请输入正确的手机号');
    }
  }
}

class InputWidget extends StatefulWidget {
  InputWidget({Key key, this.hint, this.phoneController, this.passController})
      : super(key: key);

  final String hint;

  //手机号的控制器
  final TextEditingController phoneController;

  //密码的控制器
  final TextEditingController passController;

  @override
  State<StatefulWidget> createState() => new _InputWidget();
}

class _InputWidget extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: new TextField(
        controller: widget.hint.contains("账号")
            ? widget.phoneController
            : widget.passController,
        decoration: new InputDecoration(
            labelText: widget.hint,
            labelStyle: TextStyle(fontSize: 14, color: Colors.grey)),
        keyboardType: widget.hint.contains("账号")
            ? TextInputType.phone
            : TextInputType.text,
        obscureText: !widget.hint.contains("账号"),
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
