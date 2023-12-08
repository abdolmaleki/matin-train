import 'dart:convert';

class UserModel {
  int? id;
  List<RoleIds>? roleIds;
  int? staffId;
  int? customerId;
  String? firstName;
  String? lastName;
  String? username;
  String? password;
  String? email;
  String? phone;
  String? telephone;
  dynamic languageSkills;
  String? registrationNumber;
  String? workPhoneNumber;
  dynamic gender;
  String? accountNumber;
  String? nationalCode;
  String? birthDate;
  String? avatarUrl;
  bool? forcedChangePassword;
  List<Roles>? roles;
  String? privacyPolicyAcceptedAt;
  String? userType;
  String? suspendedAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  UserModel(
      {this.id,
        this.roleIds,
        this.staffId,
        this.customerId,
        this.firstName,
        this.lastName,
        this.username,
        this.password,
        this.email,
        this.phone,
        this.telephone,
        this.languageSkills,
        this.registrationNumber,
        this.workPhoneNumber,
        this.gender,
        this.accountNumber,
        this.nationalCode,
        this.birthDate,
        this.avatarUrl,
        this.forcedChangePassword,
        this.roles,
        this.privacyPolicyAcceptedAt,
        this.userType,
        this.suspendedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['roleIds'] != null) {
      roleIds = <RoleIds>[];
      json['roleIds'].forEach((v) {
        roleIds!.add(RoleIds.fromJson(v));
      });
    }
    staffId = json['staffId'];
    customerId = json['customerId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    telephone = json['telephone'];
    languageSkills = json['languageSkills'];
    registrationNumber = json['registrationNumber'];
    workPhoneNumber = json['workPhoneNumber'];
    gender = json['gender'];
    accountNumber = json['accountNumber'];
    nationalCode = json['nationalCode'];
    birthDate = json['birthDate'];
    avatarUrl = json['avatarUrl'];
    forcedChangePassword = json['forcedChangePassword'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    privacyPolicyAcceptedAt = json['privacy_policy_accepted_at'];
    userType = json['userType'];
    suspendedAt = json['suspended_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (roleIds != null) {
      data['roleIds'] = roleIds!.map((v) => v.toJson()).toList();
    }
    data['staffId'] = staffId;
    data['customerId'] = customerId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['telephone'] = telephone;
    data['languageSkills'] = languageSkills;
    data['registrationNumber'] = registrationNumber;
    data['workPhoneNumber'] = workPhoneNumber;
    data['gender'] = gender;
    data['accountNumber'] = accountNumber;
    data['nationalCode'] = nationalCode;
    data['birthDate'] = birthDate;
    data['avatarUrl'] = avatarUrl;
    data['forcedChangePassword'] = forcedChangePassword;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['privacy_policy_accepted_at'] = privacyPolicyAcceptedAt;
    data['userType'] = userType;
    data['suspended_at'] = suspendedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }

  static UserModel fromString(String str){
    Map<String, dynamic> map=json.decode(str);
    return UserModel.fromJson(map);
  }
}

class RoleIds {
  int? id;

  RoleIds({this.id});

  RoleIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  List<Permissions>? permissions;

  Roles({this.id, this.name, this.permissions});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (permissions != null) {
      data['permissions'] = permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Permissions {
  int? id;
  String? name;
  String? title;

  Permissions({this.id, this.name, this.title});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    return data;
  }
}