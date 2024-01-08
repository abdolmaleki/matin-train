class GetPermissionResponse {
  List<Items>? items;
  int? limit;
  int? offset;
  int? page;
  int? totalPages;
  int? totalRows;

  GetPermissionResponse(
      {this.items,
        this.limit,
        this.offset,
        this.page,
        this.totalPages,
        this.totalRows});

  GetPermissionResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    limit = json['limit'];
    offset = json['offset'];
    page = json['page'];
    totalPages = json['totalPages'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    data['totalRows'] = this.totalRows;
    return data;
  }
}

class Items {
  int? id;
  String? name;
  String? title;

  Items({this.id, this.name, this.title});

  Items.fromJson(Map<String, dynamic> json) {
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
