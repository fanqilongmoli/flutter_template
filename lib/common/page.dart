import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///定义一个需要的类型
typedef BuildWidget = Widget Function(BuildContext context);

abstract class BasePage extends StatelessWidget {
  ///设置title
  final String title;

  ///padding
  final double padding;

  ///是否添加滑动
  final bool includeScrollView;

  BasePage(this.title, {this.padding, this.includeScrollView = true});

  ///负责提供给子类的方法
  Widget generateChildren(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return _HomePage(
      title: title ?? "-_-!",
      buildWidget: generateChildren,
      padding: padding ?? 0,
      includeScrollView: includeScrollView,
    );
  }

  ///公用的SnackBar
  void showSnackBar(BuildContext context, String message,
      {Duration duration = const Duration(milliseconds: 850)}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: duration,
    ));
  }
}

class _HomePage extends StatelessWidget {
  final String title;

  final BuildWidget buildWidget;

  final double padding;

  final bool includeScrollView;

  _HomePage(
      {this.title,
      @required this.buildWidget,
      @required this.includeScrollView,
      this.padding});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _HomePageWidget(
        buildWidget: buildWidget,
        padding: padding,
        includeScrollView: includeScrollView,
      ),
    );
  }
}

class _HomePageWidget extends StatelessWidget {
  final BuildWidget buildWidget;

  final double padding;

  final bool includeScrollView;

  _HomePageWidget(
      {@required this.buildWidget,
      @required this.includeScrollView,
      this.padding});

  @override
  Widget build(BuildContext context) {
    var builder = Builder(builder: (context) {
      return buildWidget(context);
    });
    return Padding(
        padding: EdgeInsets.all(padding),
        child: includeScrollView
            ? SingleChildScrollView(child: builder)
            : builder);
  }
}
