import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_template/models/product.dart';

/// SliverPersistentHeader 给一个可滑动是视图添加一个头（实际上，在CustomScrollView的slivers列表中，header可以在视图的任何位置中，不一定要在顶部）
/// 这个Header可以随着划定展开和收起，使用inned 和 floating 属性来控制收起时Header是否展示（ pinned 和 floating 属性不可以同时为 true ）,
/// pinned 和 floating 属性的具体意义和SliverAppBar中相同
///

final List<String> titleAssets = [
  'images/food01.jpeg',
  'images/food02.jpeg',
  'images/food03.jpeg',
];

final List<ProductItem> _products = [
  ProductItem(
    name: 'Bueno Chocolate',
    asset: 'images/food01.jpeg',
  ),
  ProductItem(
    name: 'Chocolate with berries',
    asset: 'images/food02.jpeg',
  ),
  ProductItem(
    name: 'Trumoo Candies',
    asset: 'images/food03.jpeg',
  ),
  ProductItem(
    name: 'Choco-coko',
    asset: 'images/food04.jpeg',
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'images/food05.jpeg',
  ),
  ProductItem(
    name: 'Chocolate',
    asset: 'images/food06.jpeg',
  ),
  ProductItem(
    name: 'Bueno Chocolate',
    asset: 'images/food01.jpeg',
  ),
  ProductItem(
    name: 'Choco-coko',
    asset: 'images/food04.jpeg',
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'images/food05.jpeg',
  ),
];
final List<ProductItem> _products2 = []..addAll(_products)..addAll(_products);

class SliverHeader extends StatefulWidget {
  @override
  _SliverHeaderState createState() => _SliverHeaderState();
}

class _SliverHeaderState extends State<SliverHeader> {
  bool floating = false;
  bool pinned = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverHeader"),
        actions: <Widget>[_buildActions()],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildHeader(0),
          SliverGrid.count(
            crossAxisCount: 3,
            children: _products.map((product) {
              return _buildItemGrid(product);
            }).toList(),
          ),
          _buildHeader(1),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate(
              products.map((product) {
                return _buildItemList(product);
              }).toList(),
            ),
          ),
          _buildHeader(2),
          SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItemGrid2(_products2[index]);
              },
              childCount: _products2.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem<int>(
          value: 0,
          child: Text('reset'),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text('floating'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('pinned'),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            setState(() {
              floating = false;
              pinned = false;
            });
            break;
          case 1:
            setState(() {
              floating = true;
              pinned = false;
            });
            break;
          case 2:
            setState(() {
              floating = false;
              pinned = true;
            });
            break;
        }
      },
    );
  }

  SliverPersistentHeader _buildHeader(int index) {
    String asset = titleAssets[index];
    return SliverPersistentHeader(
      pinned: pinned,
      floating: floating,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 180.0,
        child: Container(
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.plus,
            image: DecorationImage(
              image: AssetImage(asset),
              fit: BoxFit.fill,
            ),
            color: Colors.white,
          ),
//          child: BackdropFilter(
//            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
//            child: Container(
//              child: Center(
//                child: Text(
//                  'This is header ${index + 1}',
//                  style: TextStyle(
//                    fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//                    color: Color(0xE5FFFFFF),
//                  ),
//                ),
//              ),
//            ),
//          ),
        ),
      ),
    );
  }

  Widget _buildItemGrid(ProductItem product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                child: SizedBox(
                  width: 65.0,
                  height: 65.0,
                  child: Image.asset(
                    product.asset,
                    fit: BoxFit.cover,
                  ),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    product.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemList(ProductItem product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 65.0,
                    height: 65.0,
                    child: Image.asset(
                      product.asset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemGrid2(ProductItem product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: Image.asset(
                      product.asset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  // 最大
  @override
  double get maxExtent => max(maxHeight, minHeight);

  // 最小
  @override
  double get minExtent => minHeight;

  // 是否重新build
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
    ;
  }
}
