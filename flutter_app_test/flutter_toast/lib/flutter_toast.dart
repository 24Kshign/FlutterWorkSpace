import 'package:flutter/services.dart';

class FlutterToast {
  static const MethodChannel _channel = const MethodChannel('flutter_toast');


  static void showShortToast(String messsage) =>
      _channel.invokeMethod("showShortToast", {"message": messsage});

  static void showLongToast(String message) =>
      _channel.invokeMethod("showLongToast", {"message": message});

  static void showToast(String message, int duration) => _channel
      .invokeMethod("showToast", {"message": message, "duration": duration});
}
