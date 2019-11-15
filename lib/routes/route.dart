import 'package:flutter/material.dart';
import 'package:flutter_template/container/wrap.dart';
import 'package:flutter_template/model/category.dart';
import 'package:flutter_template/widget/button.dart';
import 'package:flutter_template/widget/dialog.dart';
import 'package:flutter_template/widget/form.dart';
import 'package:flutter_template/widget/grid_view.dart';

final List<Map<String, Widget>> pathToWidgetMap = [
  {"/widget/Button": ButtonPage()},
  {"/widget/Dialog": DialogPage()},
  {"/widget/Form": FormPage()},
  {"/widget/SimpleGridView": SimpleGridViewPage()},
  {"/container/Wrap": WrapPage()},
];

final Map<String, IconData> icons = {
  "/widget/Button": Icons.aspect_ratio,
  "/widget/Dialog": Icons.map,
  "/widget/Form": Icons.format_color_text,
  "/widget/SimpleGridView": Icons.grid_on,
  "/container/Wrap": Icons.wrap_text,
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
