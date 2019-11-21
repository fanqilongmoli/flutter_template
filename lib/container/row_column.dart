import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/page.dart';

class RowColumnPage extends BasePage {
  RowColumnPage() : super("RowColumn");

  @override
  Widget generateChildren(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.down,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            SizedBox(height: 10),
            Text(MainAxisAlignment.start.toString()),
            RowMainAxisAlignment(MainAxisAlignment.start),
            SizedBox(height: 10),
            Text(MainAxisAlignment.end.toString()),
            RowMainAxisAlignment(MainAxisAlignment.end),
            SizedBox(height: 10),
            Text(MainAxisAlignment.center.toString()),
            RowMainAxisAlignment(MainAxisAlignment.center),
            SizedBox(height: 10),
            // 单个的左右间隔相同
            Text(MainAxisAlignment.spaceAround.toString()),
            RowMainAxisAlignment(MainAxisAlignment.spaceAround),
            SizedBox(height: 10),
            // 靠边均分
            Text(MainAxisAlignment.spaceBetween.toString()),
            RowMainAxisAlignment(MainAxisAlignment.spaceBetween),
            SizedBox(height: 10),
            // 所有间隔相同
            Text(MainAxisAlignment.spaceEvenly.toString()),
            RowMainAxisAlignment(MainAxisAlignment.spaceEvenly),
          ],
        ),
      ],
    );
  }
}

class RowMainAxisAlignment extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  const RowMainAxisAlignment(this.mainAxisAlignment) : super();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        Container(
          color: Colors.lightBlueAccent[100],
          width: 80.0,
          height: 50.0,
        ),
        Container(
          color: Colors.lightBlueAccent[200],
          width: 80.0,
          height: 50.0,
        ),
        Container(
          color: Colors.lightBlueAccent[400],
          width: 80.0,
          height: 50.0,
        ),
      ],
    );
  }
}
