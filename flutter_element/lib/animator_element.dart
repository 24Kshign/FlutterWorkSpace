import 'package:flutter/material.dart';

class AnimatorElement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatorState();
  }
}

class _AnimatorState extends State<AnimatorElement>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Container(
        height: animation.value,
        color: Colors.black54,
      ),
    );
  }
}
