import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

// ignore: must_be_immutable
class SimpleListViewPage extends BasePage {
  static final double itemExtent = 50;
  static final int maxSize = 50;
  final targetIndex = Random().nextInt(maxSize);

  SimpleListViewPage() : super("Simple ListView", includeScrollView: false);

  ScrollController scrollController = new ScrollController();

  @override
  Widget generateChildren(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Scrollbar(
            child: ListView(
              controller: scrollController,
              itemExtent: itemExtent,
              children: _generateListView(),
            ),
          ),
        ),
        RaisedButton(
          child: Text("Scroll to $targetIndex"),
          onPressed: () {
            scrollController.animateTo(itemExtent * targetIndex,
                duration: Duration(milliseconds: 500), curve: Curves.linear);
          },
        ),
      ],
    );
  }

  List<Widget> _generateListView() {
    List<Widget> list = List<Widget>();
    for (int i = 0; i < maxSize; i++) {
      list.add(Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text("$i"),
      ));
    }
    return list;
  }
}

class ListViewPage extends BasePage {
  ListViewPage() : super("ListView", includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return _ListView();
  }
}

class _ListView extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<_ListView> {
  static const MAX_SIZE = 80;
  static const loadEndTag = "##loadEndTag#";
  var _dataList = <String>[loadEndTag];
  Color _color1 = Colors.grey[100];

  Color _color2 = Colors.grey[200];

  Widget _divider1 = Divider(
    color: Colors.lightBlue,
    height: 2,
  );

  Widget _divider2 = Divider(
    color: Colors.lightGreen,
    height: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (_dataList[index] == loadEndTag) {
            if (_dataList.length < MAX_SIZE) {
              _generateData();
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )));
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "加载完毕",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          debugPrint("asdasdasd");
          return Container(
            height: 50,
            color: index % 2 == 0 ? _color1 : _color2,
            child: Center(
              child: Text("$index"),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? _divider1 : _divider2;
        },
        itemCount: _dataList.length,
      ),
    );
  }

  void _generateData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        List<String> list = List<String>();
        for (int i = 0; i < 20; i++) {
          list.add((_dataList.length + i).toString());
        }
        _dataList.insertAll(_dataList.length - 1, list);
      });
    });
  }
}
