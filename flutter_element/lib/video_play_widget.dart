import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:screen/screen.dart';

class VideoPlayWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayWidget(this.videoUrl);

  @override
  State<StatefulWidget> createState() => _VideoPlayWidgetState();
}

class _VideoPlayWidgetState extends State<VideoPlayWidget> {
  VideoPlayerController controller;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      if (!mounted) {
        return;
      }
      setState(() {});
    };
    //初始化VideoPlayerController
    controller = VideoPlayerController.network(widget.videoUrl);
    controller.initialize();
    controller.addListener(listener);
    controller.play();
    //屏幕保持唤醒状态
    Screen.keepOn(true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlayViewWidget(controller),
    );
  }
}

class PlayViewWidget extends StatefulWidget {
  VideoPlayerController controller;

  PlayViewWidget(this.controller);

  @override
  State<StatefulWidget> createState() {
    return _PlayViewState();
  }
}

class _PlayViewState extends State<PlayViewWidget> {
  VideoPlayerController get controller => widget.controller;

  void onClickPlay() {
    if (!controller.value.initialized) {
      return;
    }
    if (controller.value.isPlaying) {
      //播放中暂停
      controller.pause();
    } else {
      //重新播放
      controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.red;
    if (controller.value.initialized) {
      final Size size = controller.value.size;
      return Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: size.width / size.height,
                        child: VideoPlayer(controller),
                      ),
                    ),
                    onDoubleTap: onClickPlay,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: controller.value.isPlaying
                        ? Container()
                        : GestureDetector(
                            child: Icon(
                              Icons.play_circle_filled,
                              color: primaryColor,
                              size: 48.0,
                            ),
                            onTap: onClickPlay,
                          ),
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '从头看',
                          textAlign: TextAlign.center,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                          '快进',
                          textAlign: TextAlign.center,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          child: controller.value.isPlaying
                              ? Icon(
                                  Icons.pause,
                                  color: primaryColor,
                                )
                              : Icon(
                                  Icons.play_arrow,
                                  color: primaryColor,
                                ),
                        ),
                        onTap: onClickPlay,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Center(
                            child: Text(
                              "${controller.value.position.toString().split(".")[0]}",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      Expanded(
                          child: VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 1.0),
                        colors: VideoProgressColors(playedColor: primaryColor),
                      )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Center(
                            child: Text(
                              "${controller.value.duration.toString().split(".")[0]}",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    } else if (controller.value.hasError && !controller.value.isPlaying) {
      return Container(
        color: Colors.black,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              controller.initialize();
              controller.play();
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: Text("play error, try again!"),
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
