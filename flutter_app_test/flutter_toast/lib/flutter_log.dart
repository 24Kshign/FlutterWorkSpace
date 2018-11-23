import 'package:flutter/services.dart';

class FlutterLog {
  static const MethodChannel _channel = const MethodChannel('flutter_log');

  static void v(String content) =>
      _channel.invokeMethod("verbose", {"content": content, "tag": null});

  static void verbose(String tag, String content) =>
      _channel.invokeMethod("verbose", {"content": content, "tag": tag});

  static void d(String content) =>
      _channel.invokeMethod("debug", {"content": content, "tag": null});

  static void debug(String tag, String content) =>
      _channel.invokeMethod("debug", {"content": content, "tag": tag});

  static void i(String content) =>
      _channel.invokeMethod("info", {"content": content, "tag": null});

  static void info(String tag, String content) =>
      _channel.invokeMethod("info", {"content": content, "tag": tag});

  static void w(String content) =>
      _channel.invokeMethod("warn", {"content": content, "tag": null});

  static void warn(String tag, String content) =>
      _channel.invokeMethod("warn", {"content": content, "tag": tag});

  static void e(String content) =>
      _channel.invokeMethod("error", {"content": content, "tag": null});

  static void error(String tag, String content) =>
      _channel.invokeMethod("error", {"content": content, "tag": tag});

  static void j(String content) =>
      _channel.invokeMethod("json", {"content": content, "tag": null});

  static void json(String tag, String content) =>
      _channel.invokeMethod("json", {"content": content, "tag": tag});
}
