class PermissionModel {
  int? id;
  String? name;
  String? title;

  PermissionModel({this.id, this.name, this.title});

  PermissionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    return data;
  }
}