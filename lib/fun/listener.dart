import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

class ListenerPage extends BasePage {
  ListenerPage() : super('Listener', includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return ListenerWidget();
  }
}

class ListenerWidget extends StatefulWidget {
  @override
  _ListenerWidgetState createState() => _ListenerWidgetState();
}

class _ListenerWidgetState extends State<ListenerWidget> {
  PointerEvent _event;

  void refreshEvent(event) {
    setState(() => _event = event);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.lightBlue,
          width: 400,
          height: 400,
          child: Text(
            _event?.toString() ?? "",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => refreshEvent(event),
      onPointerMove: (PointerMoveEvent event) => refreshEvent(event),
      onPointerUp: (PointerUpEvent event) => refreshEvent(event),
    );
  }
}
