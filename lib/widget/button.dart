import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

class ButtonPage extends BasePage {
  ButtonPage() : super("Button", includeScrollView: false);

  void _onPressed(BuildContext context) {
    showSnackBar(context, "点我了");
  }

  @override
  Widget generateChildren(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  /// 最简单的button
                  RaisedButton(
                    child: Text("RaisedButton"),
                    onPressed: () {
                      _onPressed(context);
                    },
                  ),
                  RaisedButton.icon(
                    label: Text("RaisedButton.icon"),
                    icon: Icon(Icons.insert_emoticon),
                    onPressed: () {
                      _onPressed(context);
                    },
                  ),
                  FlatButton(
                    child: Text("FlatButton"),
                    onPressed: () {
                      _onPressed(context);
                    },
                  ),
                  FlatButton.icon(
                    label: Text("FlatButton.icon"),
                    icon: Icon(Icons.chat),
                    onPressed: () {
                      _onPressed(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.toys),
                    color: Colors.green,
                    tooltip: "is IconButton",
                    onPressed: () {
                      _onPressed(context);
                    },
                  ),
                  OutlineButton(
                    child: Text("OutlineButton"),
                    borderSide: BorderSide(color: Colors.amberAccent, width: 1),
                    highlightedBorderColor: Colors.green,
                    highlightColor: Colors.blue[600],
                    splashColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {
                      _onPressed(context);
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: RaisedButton(
                        child: Text("data"),
                        color: Colors.blue[600],
                        highlightColor: Colors.blue[700],
                        splashColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {
                          _onPressed(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
