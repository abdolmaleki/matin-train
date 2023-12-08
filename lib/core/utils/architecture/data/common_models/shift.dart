import 'package:hoivalani/core/utils/architecture/data/common_models/visit.dart';

class ShiftModel {
  OnGoingCustomer? onGoingCustomer;
  List<Staff>? staff;
  List<VisitModel>? visits;
  DateTime? date;

  ShiftModel({this.onGoingCustomer, this.staff, this.visits, this.date});

  ShiftModel.fromJson(Map<String, dynamic> json) {
    onGoingCustomer = json['onGoingCustomer'] != null
        ? OnGoingCustomer.fromJson(json['onGoingCustomer'])
        : null;
    if (json['staff'] != null) {
      staff = <Staff>[];
      json['staff'].forEach((v) {
        staff!.add(Staff.fromJson(v));
      });
    }
    if (json['visits'] != null) {
      visits = <VisitModel>[];
      json['visits'].forEach((v) {
        visits!.add(VisitModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (onGoingCustomer != null) {
      data['onGoingCustomer'] = onGoingCustomer!.toJson();
    }
    if (staff != null) {
      data['staff'] = staff!.map((v) => v.toJson()).toList();
    }
    if (visits != null) {
      data['visits'] = visits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnGoingCustomer {
  String? avatarUrl;
  String? firstName;
  String? gender;
  int? id;
  String? lastName;

  OnGoingCustomer(
      {this.avatarUrl, this.firstName, this.gender, this.id, this.lastName});

  OnGoingCustomer.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    firstName = json['firstName'];
    gender = json['gender'];
    id = json['id'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatarUrl'] = avatarUrl;
    data['firstName'] = firstName;
    data['gender'] = gender;
    data['id'] = id;
    data['lastName'] = lastName;
    return data;
  }
}

class Staff {
  String? avatarUrl;
  String? firstName;
  String? userName;
  int? id;
  String? lastName;
  Role? role;
  int? visitsCancelledCount;
  int? visitsDelayCount;
  int? visitsDoneCount;
  int? visitsNotStartedCount;
  int? visitsOnGoingCount;

  Staff(
      {this.avatarUrl,
      this.firstName,
      this.id,
      this.lastName,
      this.userName,
      this.role,
      this.visitsCancelledCount,
      this.visitsDelayCount,
      this.visitsDoneCount,
      this.visitsNotStartedCount,
      this.visitsOnGoingCount});

  Staff.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    firstName = json['firstName'];
    userName = json['userName'];
    id = json['id'];
    lastName = json['lastName'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    visitsCancelledCount = json['visitsCancelledCount'];
    visitsDelayCount = json['visitsDelayCount'];
    visitsDoneCount = json['visitsDoneCount'];
    visitsNotStartedCount = json['visitsNotStartedCount'];
    visitsOnGoingCount = json['visitsOnGoingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatarUrl'] = avatarUrl;
    data['firstName'] = firstName;
    data['id'] = id;
    data['lastName'] = lastName;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['visitsCancelledCount'] = visitsCancelledCount;
    data['visitsDelayCount'] = visitsDelayCount;
    data['visitsDoneCount'] = visitsDoneCount;
    data['visitsNotStartedCount'] = visitsNotStartedCount;
    data['visitsOnGoingCount'] = visitsOnGoingCount;
    return data;
  }
}

class Role {
  int? id;
  String? name;

  Role({this.id, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
