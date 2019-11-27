import 'package:flutter/material.dart';
import 'package:flutter_template/animation/animation_container.dart';
import 'package:flutter_template/animation/animation_widget.dart';
import 'package:flutter_template/animation/hero_animation.dart';
import 'package:flutter_template/animation/scale_animation.dart';
import 'package:flutter_template/animation/stagger_animation.dart';
import 'package:flutter_template/container/align.dart';
import 'package:flutter_template/container/constrained_box.dart';
import 'package:flutter_template/container/container.dart';
import 'package:flutter_template/container/decorated_box.dart';
import 'package:flutter_template/container/flex.dart';
import 'package:flutter_template/container/padding.dart';
import 'package:flutter_template/container/row_column.dart';
import 'package:flutter_template/container/scaffold.dart';
import 'package:flutter_template/container/scroll_physics.dart';
import 'package:flutter_template/container/sliver_app_bar.dart';
import 'package:flutter_template/container/sliver_box.dart';
import 'package:flutter_template/container/sliver_persistent_header.dart';
import 'package:flutter_template/container/stack.dart';
import 'package:flutter_template/custom_widget/gradient_button.dart';
import 'package:flutter_template/custom_widget/taiji_widget.dart';
import 'package:flutter_template/custom_widget/wave_loading_widget.dart';
import 'package:flutter_template/fun/blur.dart';
import 'package:flutter_template/container/wrap.dart';
import 'package:flutter_template/fun/clip.dart';
import 'package:flutter_template/fun/gesture_detector.dart';
import 'package:flutter_template/fun/inherited_widget.dart';
import 'package:flutter_template/fun/listener.dart';
import 'package:flutter_template/fun/transform.dart';
import 'package:flutter_template/fun/will_pop_scope.dart';
import 'package:flutter_template/model/category.dart';
import 'package:flutter_template/widget/button.dart';
import 'package:flutter_template/widget/dialog.dart';
import 'package:flutter_template/widget/form.dart';
import 'package:flutter_template/widget/grid_view.dart';
import 'package:flutter_template/widget/image.dart';
import 'package:flutter_template/widget/input.dart';
import 'package:flutter_template/widget/list_view.dart';
import 'package:flutter_template/widget/progress.dart';
import 'package:flutter_template/widget/switch_checkbox.dart';
import 'package:flutter_template/widget/text.dart';

final List<Map<String, Widget>> pathToWidgetMap = [
  {"/widget/Button": ButtonPage()},
  {"/widget/Dialog": DialogPage()},
  {"/widget/Form": FormPage()},
  {"/widget/SimpleGridView": SimpleGridViewPage()},
  {"/widget/GridView": GridViewPage()},
  {"/widget/Image": ImagePage()},
  {"/widget/Input": InputPage()},
  {"/widget/SimpleListView": SimpleListViewPage()},
  {"/widget/ListView": ListViewPage()},
  {"/widget/Progress": ProgressPage()},
  {"/widget/SwitchCheckbox": SwitchCheckboxPage()},
  {"/widget/Text": TextPage()},
  {"/container/Scaffold": ScaffoldPage()},
  {"/container/SliverAppBarPage": SliverAppBarPage()},
  {"/container/SliverHeader": SliverHeader()},
  {"/container/SliverToBoxAdapter": SliverBoxPage()},
  {"/container/ScrollPhysicsPage": ScrollPhysicsPage()},
  {"/container/ConstrainedBox": ConstrainedBoxPage()},
  {"/container/DecoratedBox": DecoratedBoxPage()},
  {"/container/RowColumn": RowColumnPage()},
  {"/container/Flex": FlexExpandedPage()},
  {"/container/Container": ContainerPage()},
  {"/container/Padding": PaddingPage()},
  {"/container/Align": AlignPage()},
  {"/container/Wrap": WrapPage()},
  {"/container/Stack": StackPage()},
  {"/animation/ScaleAnimation": ScaleAnimationPage()},
  {"/animation/AnimationWidget": AnimationWidgetPage()},
  {"/animation/HeroAnimation": HeroAnimationPage()},
  {"/animation/StaggerAnimation": StaggerAnimationPage()},
  {"/animation/AnimationContainer": AnimationContainerPage()},
  {"/fun/Transform": TransformPage()},
  {"/fun/Blur": BlurPage()},
  {"/fun/Clip": ClipPage()},
  {"/fun/WillPopScope": WillPopScopePage()},
  {"/fun/InheritedWidget": InheritedWidgetPage()},
  {"/fun/GestureDetector": GestureDetectorPage()},
  {"/fun/Listener": ListenerPage()},
  {"/customWidget/GradientButton": GradientButtonPage()},
  {"/customWidget/TaijiWidget": TaijiWidgetPage()},
  {"/customWidget/WaveLoadingWidget": WaveLoadingWidgetPage()},
];

final Map<String, IconData> icons = {
  "/widget/Button": Icons.aspect_ratio,
  "/widget/Dialog": Icons.map,
  "/widget/Form": Icons.format_color_text,
  "/widget/SimpleGridView": Icons.grid_on,
  "/widget/GridView": Icons.grid_off,
  "/widget/Image": Icons.image,
  "/widget/Input": Icons.input,
  "/widget/SimpleListView": Icons.list,
  "/widget/ListView": Icons.format_list_numbered_rtl,
  "/widget/Progress": Icons.access_time,
  "/widget/SwitchCheckbox": Icons.check_box,
  "/widget/Text": Icons.text_format,
  "/container/Align": Icons.format_align_center,
  "/container/Wrap": Icons.wrap_text,
  "/container/Scaffold": Icons.wifi_tethering,
  "/container/SliverAppBarPage": Icons.slideshow,
  "/container/SliverHeader": Icons.slideshow,
  "/container/SliverToBoxAdapter": Icons.slideshow,
  "/container/ScrollPhysicsPage": Icons.slideshow,
  "/container/ConstrainedBox": Icons.inbox,
  "/container/DecoratedBox": Icons.markunread_mailbox,
  "/container/RowColumn": Icons.view_column,
  "/container/Flex": Icons.widgets,
  "/container/Container": Icons.check_box_outline_blank,
  "/container/Padding": Icons.gamepad,
  "/container/Stack": Icons.vertical_align_center,
  "/animation/ScaleAnimation": Icons.crop_landscape,
  "/animation/AnimationWidget": Icons.crop_landscape,
  "/animation/HeroAnimation": Icons.face,
  "/animation/StaggerAnimation": Icons.map,
  "/animation/AnimationContainer": Icons.scatter_plot,
  "/fun/Clip": Icons.all_inclusive,
  "/fun/Transform": Icons.directions_transit,
  "/fun/WillPopScope": Icons.arrow_back,
  "/fun/InheritedWidget": Icons.data_usage,
  "/fun/Listener": Icons.screen_share,
  "/fun/GestureDetector": Icons.gesture,
  "/fun/Blur": Icons.blur_on,
  "/customWidget/GradientButton": Icons.gradient,
  "/customWidget/TaijiWidget": Icons.swap_horizontal_circle,
  "/customWidget/WaveLoadingWidget": Icons.cloud_download,
};

List<CategoryBean> getCategoryList() {
  List<CategoryBean> categoryBeanList = [];
  CategoryBean categoryContains(String category) {
    for (var value in categoryBeanList) {
      if (value.name == category) {
        return value;
      }
    }
    return null;
  }

  pathToWidgetMap.forEach((item) {
    item.forEach((path, widget) {
      WidgetBean widgetBean = new WidgetBean(getTagByRoutePath(path), path);
      var category = getCategoryByRoutePath(path);
      var bean = categoryContains(category);
      if (bean != null) {
        CategoryBean categoryBean =
            new CategoryBean(category, []..add(widgetBean));
        categoryBeanList.add(categoryBean);
      } else {
        bean.children.add(widgetBean);
      }
    });
  });
  return categoryBeanList;
}

String getTagByRoutePath(String routerPath) {
  List<String> temp = routerPath.split("/");
  if (temp.length > 0) {
    return temp[temp.length - 1];
  }
  return "";
}

String getCategoryByRoutePath(String routePath) {
  List<String> temp = routePath.split("/");
  if (temp.length > 0) {
    return temp[1];
  }
  return "";
}

List<String> getAllCategory() {
  List<String> categoryList = [];
  pathToWidgetMap.forEach((element) {
    element.forEach((path, widget) {
      var category = getCategoryByRoutePath(path);
      if (!categoryList.contains(category)) {
        categoryList.add(category);
      }
    });
  });
  return categoryList;
}

CategoryBean getWidgetList(String target) {
  List<WidgetBean> children = [];
  pathToWidgetMap.forEach((element) {
    element.forEach((path, widget) {
      WidgetBean widgetBean = new WidgetBean(getTagByRoutePath(path), path);
      var category = getCategoryByRoutePath(path);
      if (category == target) {
        children.add(widgetBean);
      }
    });
  });
  return CategoryBean(target, children);
}
