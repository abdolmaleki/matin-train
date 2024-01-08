class CreatePermissionResponse {
  int? id;
  String? name;
  String? title;

  CreatePermissionResponse({this.id, this.name, this.title});

  CreatePermissionResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}
