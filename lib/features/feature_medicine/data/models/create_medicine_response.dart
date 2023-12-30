class CreateMedicineResponse {
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

  CreateMedicineResponse(
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

  CreateMedicineResponse.fromJson(Map<String, dynamic> json) {
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
