class MedicineModel {
  String availability;
  String code;
  int id;
  String name;
  String manufacturer;

  MedicineModel({required this.availability,
    required this.code,
    required this.id,
    required this.name,
    required this.manufacturer});

  factory MedicineModel.fromJson(Map<String, dynamic>json){
    return MedicineModel(availability: json['availability'],
        code: json['code'],
        id: json['id'],
        name: json['name'],
        manufacturer: json['manufacturer']);
  }
}
