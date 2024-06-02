class HomeTopContainerModel {
  String icon;
  String title;
  String subtitle;
  bool isColoured;
  Function() onTap;
  HomeTopContainerModel(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.isColoured,
      required this.onTap});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['title'] = this.title;
    data['isColoured'] = this.isColoured;
    data['onTap'] = this.onTap;
    return data;
  }
}
