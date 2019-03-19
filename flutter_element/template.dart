import 'package:json_annotation/json_annotation.dart';
%t
part '%s.g.dart';
@JsonSerializable()
class %s {
%s();

%s
factory %s.fromJson(Map<String,dynamic> json) => _$%sFromJson(json);
Map<String, dynamic> toJson() => _$%sToJson(this);
@override
String toString() {
StringBuffer buffer = new StringBuffer();
buffer.write("{");

%s
buffer.write("}");
return buffer.toString();
}
}
