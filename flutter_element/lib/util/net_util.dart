import 'package:dio/dio.dart';
import 'dart:async';

class NetUtil {
  NetUtil();

  static final baseUrl = 'http://192.168.2.167:8888/';
  static final LogicError unknownError = LogicError(-1, "未知异常");

  static Dio _dio = new Dio(new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true));

  static Future<Map<String, dynamic>> get(
      String uri, Map<String, dynamic> params) {
    return _dio
        .get<Map<String, dynamic>>(uri, queryParameters: params)
        .then(logicalErrorTransform);
  }

  static Future<Map<String, dynamic>> post(
      String uri, Map<String, dynamic> params) {
    FormData formData = new FormData.from(params);
    return _dio
        .post<Map<String, dynamic>>(uri, data: formData)
        .then(logicalErrorTransform);
  }

  static Future<T> logicalErrorTransform<T>(
      Response<Map<String, dynamic>> resp) {
    if (resp.data != null) {
      if (resp.data["code"] == 200) {
        T realData = resp.data["data"];
        return Future.value(realData);
      }
    }
    print('resp--------$resp');
    print('resp.data--------${resp.data}');
    LogicError error;
    if (resp.data != null && resp.data["code"] != 200) {
      if (null != resp.data["msg"]) {
        error = new LogicError(resp.data["code"], resp.data["msg"]);
      } else {
        error = new LogicError(resp.data["code"], resp.data["data"]["msg"]);
      }
    } else {
      error = unknownError;
    }
    return Future.error(error);
  }
}

/// 统一异常类
class LogicError {
  int errorCode;
  String msg;

  LogicError(errorCode, msg) {
    this.errorCode = errorCode;
    this.msg = msg;
  }

  @override
  String toString() {
    return '请求失败:errorCode = $errorCode msg = $msg';
  }
}
