import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/util/dialog_util.dart';
import 'package:flutter_toast/flutter_toast.dart';
import 'package:flutter_toast/flutter_log.dart';
import 'package:flutter_app_test/second.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First page'),
        ),
        body: LoginWidget());
  }
}

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginWidget();
  }
}

class _LoginWidget extends State<LoginWidget> {
  Timer timer;

  //手机号的控制器
  final TextEditingController phoneController = TextEditingController();

  //密码的控制器
  final TextEditingController passController = TextEditingController();

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
      child: Column(
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
          new InputWidget(hint: '请输入账号', phoneController: phoneController),
          new InputWidget(hint: '请输入密码', passController: passController),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child: Align(
              child: SizedBox(
                height: 45.0,
                width: 270.0,
                child: RaisedButton(
                  onPressed: () => _login(context),
                  color: Colors.blue,
                  child: Text('登录',
                      style: new TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    FlutterLog.debug('firstDart', '登录');
    if (phoneController.text.length < 11) {
      FlutterToast.showShortToast('请输入正确的手机号');
      return;
    } else if (passController.text.length <= 0) {
      FlutterToast.showShortToast('请输入密码');
      return;
    }

    DialogUtil.showLoadingDialog(context, '正在登录...');

    timer = new Timer(const Duration(milliseconds: 1500), () {
      DialogUtil.dismissLoadingDialog(context);
      FlutterToast.showShortToast('登录成功');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondScreen()));
    });
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
  bool _isShowClose = false;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: new TextField(
        controller: widget.hint.contains("账号")
            ? widget.phoneController
            : widget.passController,
        decoration: InputDecoration(
            suffixIcon: Offstage(
              offstage: !_isShowClose,
              child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      widget.hint.contains("账号")
                          ? widget.phoneController.clear()
                          : widget.passController.clear();
                      _isShowClose = !_isShowClose;
                    });
                  }),
            ),
            labelText: widget.hint,
            labelStyle: TextStyle(fontSize: 14, color: Colors.grey)),
        keyboardType: widget.hint.contains("账号")
            ? TextInputType.phone
            : TextInputType.text,
        obscureText: !widget.hint.contains("账号"),
        onChanged: (String str) {
          setState(() {
            _isShowClose = str.isNotEmpty;
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
