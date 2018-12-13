import 'package:flutter/material.dart';
import 'package:flutter_amap/flutter_amap.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MapView();
  }
}

class MapView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MapView();
  }
}

class _MapView extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: AppBar(title: Text('Image组件详解')));
  }
}
