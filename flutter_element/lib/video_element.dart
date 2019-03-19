import 'package:flutter/material.dart';
import 'package:flutter_element/video_play_widget.dart';

class VideoElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '视频播放',
      home: new VideoWidget(),
    );
  }
}

class VideoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _VideoWidget();
  }
}

class _VideoWidget extends State<VideoWidget> {

  @override
  Widget build(BuildContext context) {
    return VideoPlayWidget('http://img1.lukou.com/static/ad/kuaishou_publisher/video/3x6tfysdqxc3ivu.mp4');
  }
}
