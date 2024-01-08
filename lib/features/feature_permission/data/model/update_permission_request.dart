class UpdatePermissionRequest {
  String? name;
  String? title;

  UpdatePermissionRequest({this.name, this.title});

  UpdatePermissionRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}
