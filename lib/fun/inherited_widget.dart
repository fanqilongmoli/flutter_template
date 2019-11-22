import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShareDataWidget extends InheritedWidget {
  final int counter;

  ShareDataWidget({@required this.counter, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}
