class AddressModel {
  String? name;
  String? city;
  String? street;
  String? buildingNumber;
  String? postalCode;


  AddressModel({
      this.name, this.city, this.street, this.buildingNumber, this.postalCode});

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    street = json['street'];
    buildingNumber = json['buildingNumber'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['city'] = city;
    data['street'] = street;
    data['buildingNumber'] = buildingNumber;
    data['postalCode'] = postalCode;
    return data;
  }
}