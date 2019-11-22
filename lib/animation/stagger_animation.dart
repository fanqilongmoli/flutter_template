import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/page.dart';

class StaggerAnimationPage extends BasePage {
  StaggerAnimationPage() : super("StaggerAnimation", includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return StaggerRoute();
  }
}

class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 3500), vsync: this);
    _controller.addStatusListener((AnimationStatus status) {
      switch (status) {
        case AnimationStatus.dismissed:
          debugPrint("AnimationStatus.dismissed");
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
        case AnimationStatus.completed:
          break;
      }
    });
  }

  Future<Null> _playAnimation() async {
    await _controller.forward().orCancel;
    await _controller.reverse().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: _StaggerAnimation(_controller),
      ),
    );
  }
}

// ignore: must_be_immutable
class _StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;

  Animation<double> _width;

  Animation<double> _height;

  Animation<Color> _color;

  _StaggerAnimation(this.controller) {
    _width = Tween<double>(
      begin: 60,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: controller,
        // 设置动画 队列  1.0结束
        curve: Interval(
          0.0,
          0.3,
          curve: Curves.ease,
        ),
      ),
    );
    _height = Tween<double>(
      begin: 60,
      end: 400,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.3,
          0.6,
          curve: Curves.ease,
        ),
      ),
    );
    _color = ColorTween(
      begin: Colors.lightBlue,
      end: Colors.redAccent,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: _width.value,
        height: _height.value,
        color: _color.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
