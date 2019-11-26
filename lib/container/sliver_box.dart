import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_template/models/models.dart';

/// SliverToBoxAdapter 在视图中添加一个普通的控件，那么就可以用SliverToBoxAdapter将各种视图控件组合在一起
class SliverBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverBoxPage"),
      ),
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            children: products.map((product) {
              return ProductTools.buildItemGrid(product);
            }).toList(),
          ),
          SliverToBoxAdapter(
            child: _buildSearch(),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate(
              products.map((product) {
                return ProductTools.buildItemList(product);
              }).toList(),
            ),
          ),
          SliverToBoxAdapter(
            child: _buildFooter(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(15.0),
      height: 100.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'kyokyo',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black26,
                        size: 12.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          'yumi',
                          style: TextStyle(color: Colors.black26),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: Image.asset(
                'images/shop.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          )
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 25.0, right: 25.0),
        height: 45.0,
        child: Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black26,
                  size: 20.0,
                ),
              ),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search category',
                    hintStyle: TextStyle(color: Colors.black26)),
                cursorColor: Colors.pink,
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.plus,
          image: DecorationImage(
            image: AssetImage('images/footer.jpeg'),
            fit: BoxFit.cover,
          ),
          color: Colors.white),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          child: Center(
            child: Text(
              'This is footer',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
