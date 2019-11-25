import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: "InheritedWidget");
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: ShareDataWidget(
          counter: _counter,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                _CounterWidget(),
                _CounterWidget(),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  final int counter;

  ShareDataWidget({@required this.counter, @required Widget child})
      : super(child: child);

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

class _CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<_CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).counter.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
