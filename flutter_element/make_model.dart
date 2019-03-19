import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

const TAG = "\$";
const SRC = "./json"; //JSON 目录
const DIST = "lib/models/"; //输出model目录

void walk() {
  //遍历JSON目录生成模板
  var src = new Directory(SRC);
  var list = src.listSync();
  var template = new File("./template.dart").readAsStringSync();
  File file;
  list.forEach((f) {
    if (FileSystemEntity.isFileSync(f.path)) {
      file = new File(f.path);
      var paths = path.basename(f.path).split(".");
      String name = paths.first;
      print(name);
      if (paths.last.toLowerCase() != "json" || name.startsWith("_")) return;
      if (name.startsWith("_")) return;
      //下面生成模板
      var map = json.decode(file.readAsStringSync());
      //为了避免重复导入相同的包，我们用Set来保存生成的import语句。
      var set = new Set<String>();
      StringBuffer attrs = new StringBuffer();
      StringBuffer toStringStr = new StringBuffer();
      String lastKey = (map as Map<String, dynamic>).keys.last;
      print(lastKey);
      (map as Map<String, dynamic>).forEach((key, v) {
        if (key.startsWith("_")) return;
        String type = getType(v, set, name);
        attrs.write(type);
        attrs.write(" ");
        attrs.write(key);
        attrs.writeln(";\n");
        String split = lastKey == key ? ' ' : ',';
        if (type == 'num' || type == 'bool') {
          toStringStr
              .write("buffer.write(\"\\\"$key\\\":\$$key$split\");\n\t\t");
        } else if (type == 'String') {
          toStringStr.write(
              "buffer.write(\"\\\"$key\\\":\\\"\$$key\\\"$split\");\n\t\t");
        } else {
          toStringStr.write(
              "buffer.write(\"\\\"$key\\\":\$$key.toString()$split\");\n\t\t");
        }
      });
      List<String> splitNames = name.split('_');
      String className = "";
      for (String splitName in splitNames) {
        className += splitName[0].toUpperCase() + splitName.substring(1);
      }
      var dist = format(template, [
        name,
        className,
        className,
        attrs.toString(),
        className,
        className,
        className,
        toStringStr.toString()
      ]);
      var _import = set.join(";\r\n");
      _import += _import.isEmpty ? "" : ";";
      dist = dist.replaceFirst("%t", _import);
      //将生成的模板输出
      new File("$DIST$name.dart").writeAsStringSync(dist);
    }
  });
}

String changeFirstChar(String str, [bool upper = true]) {
  return (upper ? str[0].toUpperCase() : str[0].toLowerCase()) +
      str.substring(1);
}

//将JSON类型转为对应的dart类型
String getType(v, Set<String> set, String current) {
  current = current.toLowerCase();
  if (v is bool) {
    return "bool";
  } else if (v is num) {
    return "num";
  } else if (v is Map) {
    return "Map<String,dynamic>";
  } else if (v is List) {
    return "List";
  } else if (v is String) {
    //处理特殊标志
    if (v.startsWith("$TAG[]")) {
      var className = changeFirstChar(v.substring(3), false);
      if (className.toLowerCase() != current) {
        set.add('import "$className.dart"');
      }
      return "List<${changeFirstChar(className)}>";
    } else if (v.startsWith(TAG)) {
      var fileName = changeFirstChar(v.substring(1), false);
      if (fileName.toLowerCase() != current) {
        set.add('import "$fileName.dart"');
      }
      return changeFirstChar(fileName);
    }
    return "String";
  } else {
    return "String";
  }
}

//替换模板占位符
String format(String fmt, List<Object> params) {
  int matchIndex = 0;
  String replace(Match m) {
    if (matchIndex < params.length) {
      switch (m[0]) {
        case "%s":
          return params[matchIndex++].toString();
      }
    } else {
      throw new Exception("Missing parameter for string format");
    }
    throw new Exception("Invalid format string: " + m[0].toString());
  }

  return fmt.replaceAllMapped("%s", replace);
}

void main() {
  walk();
}
