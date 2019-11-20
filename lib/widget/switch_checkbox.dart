import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

class SwitchCheckboxPage extends BasePage {
  SwitchCheckboxPage() : super("SwitchCheckboxPage");

  @override
  Widget generateChildren(BuildContext context) {
    return _SwitchCheckboxState();
  }
}

class _SwitchCheckboxState extends StatefulWidget {
  @override
  _SwitchCheckboxStateState createState() => _SwitchCheckboxStateState();
}

class _SwitchCheckboxStateState extends State<_SwitchCheckboxState> {
  bool switchSelected = true;
  bool checkBoxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.deepOrange,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(
                    value: switchSelected,
                    activeColor: Colors.blue[300],
                    activeTrackColor: Colors.red[500],
                    inactiveThumbColor: Colors.grey[400],
                    inactiveTrackColor: Colors.grey[600],
                    onChanged: (value) {
                      setState(() {
                        switchSelected = value;
                      });
                    }),
                Text(switchSelected ? "选中" : "未选中")
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Checkbox(
                value: checkBoxSelected,
                activeColor: Colors.red[200],
                checkColor: Colors.blue[500],
                onChanged: (value) {
                  setState(() {
                    checkBoxSelected = value;
                  });
                },
              ),
              Text(checkBoxSelected ? "选中" : "未选中")
            ],
          )
        ],
      ),
    );
  }
}
