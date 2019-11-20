import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/page.dart';

class AlignPage extends BasePage {
  AlignPage() : super("AlignPage");

  @override
  Widget generateChildren(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AlignmentWidget(Alignment.topLeft),
              AlignmentWidget(Alignment.topCenter),
              AlignmentWidget(Alignment.topRight),
              AlignmentWidget(Alignment.centerLeft),
              AlignmentWidget(Alignment.center),
              AlignmentWidget(Alignment.centerRight),
              AlignmentWidget(Alignment.bottomLeft),
              AlignmentWidget(Alignment.bottomCenter),
              AlignmentWidget(Alignment.bottomRight),
            ],
          ),
          SizedBox(width: 20),
          Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AlignmentWidget2(Alignment.topLeft),
              AlignmentWidget2(Alignment.topCenter),
              AlignmentWidget2(Alignment.topRight),
              AlignmentWidget2(Alignment.centerLeft),
              AlignmentWidget2(Alignment.center),
              AlignmentWidget2(Alignment.centerRight),
              AlignmentWidget2(Alignment.bottomLeft),
              AlignmentWidget2(Alignment.bottomCenter),
              AlignmentWidget2(Alignment.bottomRight),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
              verticalDirection: VerticalDirection.down,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AlignmentWidget2(Alignment.topLeft),
                AlignmentWidget2(Alignment.topCenter),
                AlignmentWidget2(Alignment.topRight),
                AlignmentWidget2(Alignment.centerLeft),
                AlignmentWidget2(Alignment.center),
                AlignmentWidget2(Alignment.centerRight),
                AlignmentWidget2(Alignment.bottomLeft),
                AlignmentWidget2(Alignment.bottomCenter),
                AlignmentWidget2(Alignment.bottomRight),
              ])
        ],
      ),
    );
  }
}

class AlignmentWidget extends StatelessWidget {
  final AlignmentGeometry alignment;

  AlignmentWidget(this.alignment) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue[800],
          width: 180,
          height: 180,
          child: Align(
            alignment: alignment,
            child: Container(
              color: Colors.lightBlueAccent[400],
              width: 120,
              height: 120,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(alignment.toString()),
        )
      ],
    );
  }
}

class AlignmentWidget2 extends StatelessWidget {
  final AlignmentGeometry alignment;

  const AlignmentWidget2(this.alignment) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue[800],
          child: Align(
            alignment: alignment,
            widthFactor: 1.5,
            heightFactor: 1.5,
            child: Container(
              color: Colors.lightBlueAccent[400],
              width: 120.0,
              height: 120.0,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        SizedBox(
          width: 180,
          child: Container(
            color: Colors.deepOrange,
            child: Text(
              alignment.toString(),
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
