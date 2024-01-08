class DeletePermissionRequest {
  List<int>? ids;

  DeletePermissionRequest({this.ids});

  DeletePermissionRequest.fromJson(Map<String, dynamic> json) {
    ids = json['ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ids'] = this.ids;
    return data;
  }
}
