import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/page.dart';

class ProgressPage extends BasePage {
  ProgressPage() : super("ProgressPage");

  @override
  Widget generateChildren(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              value: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              value: 0.6,
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: CircularProgressIndicator(
                strokeWidth: 4,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CircularProgressIndicator(
                strokeWidth: 6,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(
                strokeWidth: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                value: 0.8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
