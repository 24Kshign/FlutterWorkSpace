import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_element/models/login.dart';
import 'package:flutter_element/progress_dialog.dart';
import 'package:flutter_element/service/api_service.dart';
import 'package:flutter_element/toast_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
      ),
      body: ProgressDialog(
          isLoading: _loading,
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => _register(),
                child: Text('点击'),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () => _login(),
                  child: Text('登录'),
                ),
              ),
            ],
          )),
    );
  }

  void _register() async {
    setState(() {
      _loading = !_loading;
    });
    Map<String, String> params = Map();
    params['phone'] = '17764576286';
    params['password'] = '123456';
    await ApiService.register(params).then((v) {
      setState(() {
        _loading = !_loading;
      });
      ToastManager.showToast('注册成功');
    }).catchError((e) {
      print(e);
      ToastManager.showToast('注册失败');
      setState(() {
        _loading = !_loading;
      });
    });
  }

  void _login() async {
    setState(() {
      _loading = !_loading;
    });
    Map<String, String> params = Map();
    params['phone'] = '17764576259';
    params['password'] = '123456';
    final Login login = await ApiService.login(params).catchError((e) {
      print(e);
      ToastManager.showToast('登录失败');
      setState(() {
        _loading = !_loading;
      });
    });
    if (null != login) {
      setState(() {
        _loading = !_loading;
      });
      ToastManager.showToastLong('登录成功：\n${login.toString()})');
    }
  }

  Future<Null> _onRefresh() async {
    setState(() {
      _loading = !_loading;
    });
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = !_loading;
        ToastManager.showToast("加载完成");
      });
    });
  }
}
