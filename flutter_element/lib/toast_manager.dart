import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastManager {
  static void showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void showToastLong(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }
}
