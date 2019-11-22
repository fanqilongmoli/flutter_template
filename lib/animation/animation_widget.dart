import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/page.dart';

class AnimationWidgetPage extends BasePage {
  AnimationWidgetPage() : super("AnimationWidget");

  @override
  Widget generateChildren(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _ScaleAnimationWidget(
          duration: Duration(seconds: 3),
          beginScale: 0,
          endScale: 200,
        ),
        _ScaleAnimationWidget(
          duration: Duration(seconds: 8),
          beginScale: 0,
          endScale: 200,
        ),
        _ScaleAnimationWidget(
          duration: Duration(seconds: 8),
          beginScale: 0,
          endScale: 300,
        )
      ],
    );
  }
}

class _ScaleAnimationWidget extends StatefulWidget {
  final Duration duration;

  final double beginScale;

  final double endScale;

  _ScaleAnimationWidget({this.duration, this.beginScale, this.endScale});

  @override
  _ScaleAnimationWidgetState createState() => _ScaleAnimationWidgetState(
      duration: duration, beginScale: beginScale, endScale: endScale);
}

class _ScaleAnimationWidgetState extends State<_ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;

  AnimationController controller;

  final Duration duration;

  final double beginScale;

  final double endScale;

  _ScaleAnimationWidgetState(
      {@required this.duration, this.beginScale, @required this.endScale});

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: duration ?? Duration(seconds: 3), vsync: this);
    animation = Tween(begin: beginScale ?? 0, end: endScale).animate(controller)
      ..addListener(() {
        print("animation.value： ${animation.value}");
        setState(() => {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimationImageWidget(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _AnimationImageWidget extends AnimatedWidget {
  _AnimationImageWidget({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Image.asset("assets/images/avatar.jpg",
        width: animation.value, height: animation.value);
  }
}
