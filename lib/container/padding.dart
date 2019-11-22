import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

class PaddingPage extends BasePage {
  PaddingPage() : super("Padding");

  @override
  Widget generateChildren(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.down,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          color: Colors.blue[600],
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.red[400],
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.brown[400],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 200,
          height: 200,
          color: Colors.blue[600],
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.red[400],
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  /// padding 会挤压Container 宽高
                  padding: EdgeInsets.all(40),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.brown[400],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 200,
          height: 200,
          color: Colors.blue[600],
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.red[400],
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.brown[400],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.blue[600],
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.red[400],
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.brown[400],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.blue[600],
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.red[400],
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.brown[400],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.blue[600],
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.red[400],
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.brown[400],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
