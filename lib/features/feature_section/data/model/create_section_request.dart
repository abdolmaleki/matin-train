class CreateSectionRequest {
  String? color;
  String? description;
  String? name;
  int? parentId;

  CreateSectionRequest(
      {this.color, this.description, this.name, this.parentId});

  CreateSectionRequest.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    description = json['description'];
    name = json['name'];
    parentId = json['parentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['description'] = this.description;
    data['name'] = this.name;
    data['parentId'] = this.parentId;
    return data;
  }
}