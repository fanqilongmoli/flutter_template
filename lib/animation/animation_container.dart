import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

class AnimationContainerPage extends BasePage {
  AnimationContainerPage()
      : super("AnimationContainer", includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return AnimationContainerDemo();
  }
}

class AnimationContainerDemo extends StatefulWidget {
  @override
  _AnimationContainerDemoState createState() => _AnimationContainerDemoState();
}

class _AnimationContainerDemoState extends State<AnimationContainerDemo> {
  double _width = 80;

  double _height = 80;

  Color _color = Colors.lightBlue;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(22);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: Duration(milliseconds: 500),
          curve: Curves.linearToEaseOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}
