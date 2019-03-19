import 'dart:async';

import 'package:flutter_element/models/login.dart';
import 'package:flutter_element/util/net_util.dart';

class ApiService {
  static Future<Login> login(Map<String, String> params) {
//这里将post的uri参数写完整，该次请求就不会使用NetUtils中的baseurl了
    return NetUtil.get('login', params)
        .then((aValue) => Login.fromJson(aValue));
  }

  static Future<void> register(Map<String, String> params) {
    return NetUtil.post('register', params);
  }
}
