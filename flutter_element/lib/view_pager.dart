import 'package:flutter/material.dart';
import 'package:flutter_element/video_play_widget.dart';

class ViewPagerElement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewPagerState();
  }
}

class _ViewPagerState extends State<ViewPagerElement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewPager'),
      ),
      body: _ViewPagerWidget(),
    );
  }
}

class _ViewPagerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewPagerWidgetState();
  }
}

class _ViewPagerWidgetState extends State<_ViewPagerWidget> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      reverse: true,
      onPageChanged: (index) {
        print("index---->" + index.toString());
      },
      children: <Widget>[
        VideoPlayWidget(
            'http://img1.lukou.com/static/ad/kuaishou_publisher/video/3xdi57ibwir5p9s.mp4'),
        VideoPlayWidget(
            'http://img1.lukou.com/static/ad/kuaishou_publisher/video/3xpfsrpm9css856.mp4'),
        VideoPlayWidget(
            'http://img1.lukou.com/static/ad/kuaishou_publisher/video/3x6fpx5yhk5upv2.mp4'),
        VideoPlayWidget(
            'http://img1.lukou.com/static/ad/kuaishou_publisher/video/3xvgfqx4mn24mrk.mp4'),
        VideoPlayWidget(
            'http://img1.lukou.com/static/ad/kuaishou_publisher/video/3xrsa3cw2s8w9ny.mp4'),
      ],
      scrollDirection: Axis.vertical,
    );
  }
}
