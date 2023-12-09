import 'package:team_project/core/utils/architecture/data/common_models/address.dart';

class RelativeModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? relatives;
  AddressModel? address;

  RelativeModel(
      {this.firstName, this.lastName, this.phone, this.email, this.relatives,this.address});

  RelativeModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    relatives = json['relatives'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['relatives'] = relatives;
    return data;
  }
}
