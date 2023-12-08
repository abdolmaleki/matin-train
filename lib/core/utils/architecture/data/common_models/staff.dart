import 'package:hoivalani/core/utils/architecture/domain/common_enums/staff_type.dart';

class StaffModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;
  String? userName;
  StaffType? staffType;

  StaffModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.avatar,
      this.staffType,
      this.userName});

  StaffModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    userName = json['userName'];
    staffType = StaffType.values
        .firstWhere((element) => element.name == json['staffType']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['userName'] = userName;
    return data;
  }
}
