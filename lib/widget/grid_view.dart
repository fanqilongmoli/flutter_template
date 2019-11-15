import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_template/common/page.dart';

/// 简单的GridView 使用
/// GridView.count GridView.extent GridView
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

/// GridView.builder 使用方法
class GridViewPage extends BasePage {
  GridViewPage() : super("GridViewPage",includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return _GridView();
  }
}

class _GridView extends StatefulWidget {
  @override
  _GridViewState createState() => _GridViewState();
}

class _GridViewState extends State<_GridView> {
  static const MAX_SIZE = 150;
  var _dataList = <String>[];

  Color _black = Colors.black;

  Color _white = Colors.white;

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: _dataList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == _dataList.length - 1) {
            if (_dataList.length < MAX_SIZE) {
              _generateData();
            }
          }

          return Container(
            height: 50,
            color: index % 2 == 0 ? _black : _white,
            child: Center(
              child: Text(
                "$index",
                style: TextStyle(
                  color: index % 2 == 0 ? _white : _black,
                ),
              ),
            ),
          );
        });
  }

  void _generateData() {
    Future.delayed(Duration(milliseconds: 400)).then((e) {
      setState(() {
        List<String> list = List<String>();
        for (int i = 0; i < 20; i++) {
          list.add((_dataList.length + i).toString());
        }
        _dataList.addAll(list);
      });
    });
  }
}
