import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Flutter中可以通过WillPopScope来实现返回按钮拦截，我们看看WillPopScope的默认构造函数
/// onWillPop是一个回调函数，当用户点击返回按钮时被调用（包括导航返回按钮及Android物理返回按钮）。
/// 该回调需要返回一个Future对象，如果返回的Future最终值为false时，则当前路由不出栈(不会返回)；
/// 最终值为true时，当前路由出栈退出。我们需要提供这个回调来决定是否退出。

class WillPopScopePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScopeWidget(
      MaterialApp(
        title: "WillPopScope",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text("WillPopScope"),
          ),
          body: Center(
            child: Text("1秒内连续按两次返回键将退出页面"),
          ),
        ),
      ),
    );
  }
}

class WillPopScopeWidget extends StatefulWidget {
  final Widget child;

  WillPopScopeWidget(this.child);

  @override
  _WillPopScopeWidgetState createState() => _WillPopScopeWidgetState(child);
}

class _WillPopScopeWidgetState extends State<WillPopScopeWidget> {
  final Widget child;

  DateTime _lastPressedAt;

  _WillPopScopeWidgetState(this.child);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: child);
  }
}
