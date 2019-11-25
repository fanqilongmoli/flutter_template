import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/page.dart';

class GestureDetectorPage extends BasePage {
  GestureDetectorPage() : super("GestureDetector", includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return _GestureDetectorWidget();
  }
}

class _GestureDetectorWidget extends StatefulWidget {
  @override
  _GestureDetectorWidgetState createState() => _GestureDetectorWidgetState();
}

class _GestureDetectorWidgetState extends State<_GestureDetectorWidget> {
  String _operation = "可以点击并拖动滑块";

  double _top = 0.0;

  double _left = 0.0;

  double screenWidth;

  double screenHeight;

  @override
  Widget build(BuildContext context) {
    if (screenWidth == null) {
      final size = MediaQuery.of(context).size;
      screenWidth = size.width;
      screenHeight = size.height;
    }
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top ?? screenWidth / 7,
          left: _left ?? 0,
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.lightBlue,
              width: 200,
              height: 200,
              child: Text(
                _operation,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => _updateText("单击"),
            onDoubleTap: () => _updateText("双击"),
            onLongPress: () => _updateText("长按"),
            onPanDown: (DragDownDetails d) {
              _updateText("手指按下");
            },
            onPanUpdate: (DragUpdateDetails d) {
              _updateText("滑动中");
              setState(() {
                _left += d.delta.dx;
                _top += d.delta.dy;

                if (_left + 200 > screenWidth) {
                  _left = screenWidth - 200;
                }
                if (_left < 0) {
                  _left = 0;
                }
                if (_top < screenHeight / 7) {
                  _top = screenHeight / 7;
                }
                if (_top > screenHeight / 4 + 200) {
                  _top = screenHeight / 4 + 200;
                }
              });
            },
            onPanEnd: (DragEndDetails d) {
              _updateText("滑动结束");
            },
          ),
        )
      ],
    );
  }

  void _updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
