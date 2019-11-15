/// 分类bean
class CategoryBean {
  final String name;
  final List<WidgetBean> children;
  CategoryBean(this.name, this.children);
}

class WidgetBean {
  final String name;

  final String routePath;

  WidgetBean(this.name, this.routePath);
}
