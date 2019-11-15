import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_template/common/page.dart';

class SimpleGridViewPage extends BasePage {
  SimpleGridViewPage() : super("SimpleGridViewPage", includeScrollView: false);

  /// crossAxis 非滚动轴
  /// mainAxis 滚动轴
  @override
  Widget generateChildren(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            children: _generateWidget(10, Colors.lightBlue),
          ),
        ),
        Flexible(
          flex: 1,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: _generateWidget(20, Colors.teal),
          ),
        ),
        Flexible(
          flex: 1,
          child: GridView.extent(
            maxCrossAxisExtent: 90,
            scrollDirection: Axis.horizontal,
            // childAspectRatio c/m 比例
            childAspectRatio: 16 / 9,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: _generateWidget(10, Colors.brown),
          ),
        )
      ],
    );
  }

  List<Widget> _generateWidget(int size, Color color) {
    List list = new List<Widget>();
    for (int i = 0; i < size; i++) {
      list.add(Container(
        color: color,
      ));
    }
    return list;
  }
}
