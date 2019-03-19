// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login()
    ..phone = json['phone'] as String
    ..token = json['token'] as String
    ..userId = json['userId'] as num;
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'phone': instance.phone,
      'token': instance.token,
      'userId': instance.userId
    };
