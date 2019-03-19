import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';
@JsonSerializable()
class Login {
Login();

String phone;

String token;

num userId;


factory Login.fromJson(Map<String,dynamic> json) => _$LoginFromJson(json);
Map<String, dynamic> toJson() => _$LoginToJson(this);
@override
String toString() {
StringBuffer buffer = new StringBuffer();
buffer.write("{");

buffer.write("\"phone\":\"$phone\",");
		buffer.write("\"token\":\"$token\",");
		buffer.write("\"userId\":$userId ");
		
buffer.write("}");
return buffer.toString();
}
}
