import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/page.dart';
import 'package:flutter_template/models/models.dart';

/// ScrollPhysics 类型
/// BouncingScrollPhysics 允许滚动超过边界 内容会反弹回来  类似ios
/// ClampingScrollPhysics  防止内容超过边界 类似Android
/// AlwaysScrollableScrollPhysics 始终响应用户的滚动
/// NeverScrollableScrollPhysics 不响应用户的滚动
///
///
/// CustomScrollView(physics: BouncingScrollPhysics())
/// ListView.builder(physics: AlwaysScrollableScrollPhysics())
/// GridView.count(physics: NeverScrollableScrollPhysics())

class ScrollPhysicsPage extends BasePage {
  ScrollPhysicsPage() : super("ScrollPhysics", includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ProductTools.buildItemList(products2[index]);
          }, childCount: products2.length),
        )
      ],
    );
  }
}

class MyScrollPhysics extends ScrollPhysics {
  /// [position] 当前的位置, [offset] 用户拖拽距离
  /// 将用户拖拽距离 offset 转为需要移动的 pixels
  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return super.applyPhysicsToUserOffset(position, offset);
  }

  /// 返回 overscroll ，如果返回 0 ，overscroll 就一直是0
  /// 返回边界条件
  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    return super.applyBoundaryConditions(position, value);
  }

  ///创建一个滚动的模拟器
  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    return super.createBallisticSimulation(position, velocity);
  }

  ///最小滚动数据
  ///double get minFlingVelocity

  ///传输动量，返回重复滚动时的速度
  ///double carriedMomentum(double existingVelocity)

  ///最小的开始拖拽距离
  ///double get dragStartDistanceMotionThreshold

  ///滚动模拟的公差
  ///指定距离、持续时间和速度差应视为平等的差异的结构。
  ///Tolerance get tolerance

}
