class GetSectionResponse {
  List<Items>? items;
  int? limit;
  int? offset;
  int? page;
  int? totalPages;
  int? totalRows;

  GetSectionResponse(
      {this.items,
        this.limit,
        this.offset,
        this.page,
        this.totalPages,
        this.totalRows});

  GetSectionResponse.fromJson(Map<String, dynamic> json) {
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
  List<Children>? children;
  String? color;
  String? description;
  int? id;
  String? name;
  Parent? parent;

  Items(
      {this.children,
        this.color,
        this.description,
        this.id,
        this.name,
        this.parent});

  Items.fromJson(Map<String, dynamic> json) {
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    color = json['color'];
    description = json['description'];
    id = json['id'];
    name = json['name'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['color'] = this.color;
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    return data;
  }
}

class Children {
  String? color;
  String? description;
  int? id;
  String? name;
  Parent? parent;

  Children({this.color, this.description, this.id, this.name, this.parent});

  Children.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    description = json['description'];
    id = json['id'];
    name = json['name'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    return data;
  }
}

class Parent {
  String? color;
  String? description;
  int? id;
  String? name;

  Parent({this.color, this.description, this.id, this.name});

  Parent.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    description = json['description'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}