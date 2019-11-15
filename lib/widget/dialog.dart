import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/page.dart';

class DialogPage extends BasePage {
  DialogPage() : super("DialogPage");

  @override
  Widget generateChildren(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RaisedButton(
            child: Text("默认对话框样式"),
            onPressed: () async {
              var result = await _showAlertDialog(context);
              showSnackBar(context, result?.toString());
            },
          ),
          RaisedButton(
            child: Text("自定义对话框样式"),
            onPressed: () async {
              var result = await _showCustomAlertDialog(context);
              showSnackBar(context, result?.toString());
            },
          ),
          RaisedButton(
            child: Text("显示列表对话框"),
            onPressed: () async {
              var result = await _showSimpleDialog(context);
              showSnackBar(context, result?.toString());
            },
          ),
          RaisedButton(
            child: Text("显示Android时间对话框"),
            onPressed: () async {
              var result = await _showDatePickerDialogAndroid(context);
              showSnackBar(context, result?.toString());
            },
          ),
          RaisedButton(
            child: Text("显示ios时间对话框"),
            onPressed: () async {
              var result = await _showDatePickerDialogIos(context);
              showSnackBar(context, result?.toString());
            },
          ),
          RaisedButton(
            child: Text("显示从底部弹出的对话框"),
            onPressed: () async {
              var result = await _showModalBottomSheet(context);
              showSnackBar(context, result?.toString());
            },
          )
        ],
      ),
    );
  }

  Future<bool> _showAlertDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("默认对话框样式"),
            content: Text("确定注销当前账号吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              FlatButton(
                child: Text("注销"),
                onPressed: () => Navigator.of(context).pop(true),
              )
            ],
          );
        });
  }

  Future<bool> _showCustomAlertDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("注销账号"),
            titleTextStyle: TextStyle(fontSize: 16, color: Colors.pinkAccent),
            content: Text("确定注销当前账号吗?"),
            contentTextStyle: TextStyle(fontSize: 16, color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0.9,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "取消",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
              FlatButton(
                child: Text(
                  "注销",
                  style: TextStyle(fontSize: 12, color: Colors.pinkAccent),
                ),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        });
  }

  Future<int> _showSimpleDialog(BuildContext context) {
    return showDialog<int>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("选择时间"),
            children: <Widget>[
              SimpleDialogOption(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text("上午"),
                ),
                onPressed: () {
                  Navigator.of(context).pop(1);
                },
              ),
              SimpleDialogOption(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text("下午"),
                ),
                onPressed: () {
                  Navigator.of(context).pop(2);
                },
              ),
              SimpleDialogOption(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text("晚上"),
                ),
                onPressed: () {
                  Navigator.of(context).pop(3);
                },
              )
            ],
          );
        });
  }

  Future<DateTime> _showDatePickerDialogAndroid(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date.subtract(
        Duration(days: 7),
      ),
      lastDate: date.add(
        Duration(days: 7),
      ),
    );
  }

  Future<DateTime> _showDatePickerDialogIos(BuildContext context) {
    var date = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              minimumDate: date.subtract(
                Duration(days: 7),
              ),
              maximumDate: date.add(
                Duration(days: 7),
              ),
              minimumYear: date.year - 2,
              maximumYear: date.year + 1,
              use24hFormat: true,
              onDateTimeChanged: (DateTime value) {},
            ),
          );
        });
  }

  Future<int> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
        context: context,
        builder: (context) {
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
                onTap: () => Navigator.pop(context, index),
              );
            },
          );
        });
  }
}
