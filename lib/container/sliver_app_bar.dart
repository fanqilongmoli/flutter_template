import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

///const SliverAppBar({
///    Key key,
///     this.leading,//左侧的图标或文字，多为返回箭头
///     this.automaticallyImplyLeading = true,//没有leading为true的时候，默认返回箭头，没有leading且为false，则显示title
///     this.title,//标题
///     this.actions,//标题右侧的操作
///     this.flexibleSpace,//可以理解为SliverAppBar的背景内容区
///     this.bottom,//SliverAppBar的底部区
///     this.elevation,//阴影
///     this.forceElevated = false,//是否显示阴影
///     this.backgroundColor,//背景颜色
///     this.brightness,//状态栏主题，默认Brightness.dark，可选参数light
///     this.iconTheme,//SliverAppBar图标主题
///     this.actionsIconTheme,//action图标主题
///     this.textTheme,//文字主题
///     this.primary = true,//是否显示在状态栏的下面,false就会占领状态栏的高度
///     this.centerTitle,//标题是否居中显示
///     this.titleSpacing = NavigationToolbar.kMiddleSpacing,//标题横向间距
///     this.expandedHeight,//合并的高度，默认是状态栏的高度加AppBar的高度
///     this.floating = false,//滑动时是否悬浮
///     this.pinned = false,//标题栏是否固定
///     this.snap = false,//配合floating使用
///   })
///

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("asd"),
            expandedHeight: 230,
            floating: true,
            pinned: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
//              title: Text("标题"),
              collapseMode: CollapseMode.pin,
              background: Image.asset(
                "assets/images/avatar.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                      title: new Text("Item $index"),
                    ),
                childCount: 20),
          ),
        ],
      ),
    );
  }
}
