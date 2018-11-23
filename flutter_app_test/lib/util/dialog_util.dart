import 'package:flutter/material.dart';
import 'package:flutter_app_test/util/dialog_loading.dart';

class DialogUtil {
  static void showLoadingDialog(BuildContext context, String content) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new DialogLoading(text: content);
        });
  }

  static void dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
