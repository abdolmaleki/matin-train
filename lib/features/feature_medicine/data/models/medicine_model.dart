class MedicineRequest {
  List<Items>? items;
  int? limit;
  int? offset;
  int? page;
  int? totalPages;
  int? totalRows;

  MedicineRequest(
      {this.items,
        this.limit,
        this.offset,
        this.page,
        this.totalPages,
        this.totalRows});

  MedicineRequest.fromJson(Map<String, dynamic> json) {
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
  String? availability;
  String? code;
  String? conditions;
  String? description;
  int? id;
  String? instruction;
  String? manufacturer;
  String? name;
  String? purposeOfUse;
  String? sideEffects;

  Items(
      {this.availability,
        this.code,
        this.conditions,
        this.description,
        this.id,
        this.instruction,
        this.manufacturer,
        this.name,
        this.purposeOfUse,
        this.sideEffects});

  Items.fromJson(Map<String, dynamic> json) {
    availability = json['availability'];
    code = json['code'];
    conditions = json['conditions'];
    description = json['description'];
    id = json['id'];
    instruction = json['instruction'];
    manufacturer = json['manufacturer'];
    name = json['name'];
    purposeOfUse = json['purposeOfUse'];
    sideEffects = json['sideEffects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availability'] = this.availability;
    data['code'] = this.code;
    data['conditions'] = this.conditions;
    data['description'] = this.description;
    data['id'] = this.id;
    data['instruction'] = this.instruction;
    data['manufacturer'] = this.manufacturer;
    data['name'] = this.name;
    data['purposeOfUse'] = this.purposeOfUse;
    data['sideEffects'] = this.sideEffects;
    return data;
  }
}