
import 'package:team_project/core/utils/architecture/data/common_models/shift.dart';

class CycleVisitsModel {
  String? createdAt;
  String? deletedAt;
  String? endDate;
  String? freezePeriodDate;
  int? id;
  String? name;
  String? periodLength;
  String? shiftEveningEndTime;
  String? shiftEveningStartTime;
  String? shiftMorningEndTime;
  String? shiftMorningStartTime;
  String? shiftNightEndTime;
  String? shiftNightStartTime;
  List<ShiftModel>? shifts;
  List<StaffTypes>? staffTypes;
  String? startDate;
  String? status;
  String? updatedAt;

  CycleVisitsModel(
      {this.createdAt,
        this.deletedAt,
        this.endDate,
        this.freezePeriodDate,
        this.id,
        this.name,
        this.periodLength,
        this.shiftEveningEndTime,
        this.shiftEveningStartTime,
        this.shiftMorningEndTime,
        this.shiftMorningStartTime,
        this.shiftNightEndTime,
        this.shiftNightStartTime,
        this.shifts,
        this.staffTypes,
        this.startDate,
        this.status,
        this.updatedAt});

  CycleVisitsModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    endDate = json['end_date'];
    freezePeriodDate = json['freeze_period_date'];
    id = json['id'];
    name = json['name'];
    periodLength = json['periodLength'];
    shiftEveningEndTime = json['shiftEveningEndTime'];
    shiftEveningStartTime = json['shiftEveningStartTime'];
    shiftMorningEndTime = json['shiftMorningEndTime'];
    shiftMorningStartTime = json['shiftMorningStartTime'];
    shiftNightEndTime = json['shiftNightEndTime'];
    shiftNightStartTime = json['shiftNightStartTime'];
    if (json['shifts'] != null) {
      shifts = <ShiftModel>[];
      json['shifts'].forEach((v) {
        shifts!.add(ShiftModel.fromJson(v));
      });
    }
    if (json['staffTypes'] != null) {
      staffTypes = <StaffTypes>[];
      json['staffTypes'].forEach((v) {
        staffTypes!.add(StaffTypes.fromJson(v));
      });
    }
    startDate = json['start_date'];
    status = json['status'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['deleted_at'] = deletedAt;
    data['end_date'] = endDate;
    data['freeze_period_date'] = freezePeriodDate;
    data['id'] = id;
    data['name'] = name;
    data['periodLength'] = periodLength;
    data['shiftEveningEndTime'] = shiftEveningEndTime;
    data['shiftEveningStartTime'] = shiftEveningStartTime;
    data['shiftMorningEndTime'] = shiftMorningEndTime;
    data['shiftMorningStartTime'] = shiftMorningStartTime;
    data['shiftNightEndTime'] = shiftNightEndTime;
    data['shiftNightStartTime'] = shiftNightStartTime;
    if (shifts != null) {
      data['shifts'] = shifts!.map((v) => v.toJson()).toList();
    }
    if (staffTypes != null) {
      data['staffTypes'] = staffTypes!.map((v) => v.toJson()).toList();
    }
    data['start_date'] = startDate;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class StaffTypes {
  int? cycleId;
  String? datetime;
  int? id;
  int? neededStaffCount;
  int? remindStaffCount;
  Role? role;
  int? roleId;
  String? shiftName;
  int? usedStaffCount;

  StaffTypes(
      {this.cycleId,
        this.datetime,
        this.id,
        this.neededStaffCount,
        this.remindStaffCount,
        this.role,
        this.roleId,
        this.shiftName,
        this.usedStaffCount});

  StaffTypes.fromJson(Map<String, dynamic> json) {
    cycleId = json['cycleId'];
    datetime = json['datetime'];
    id = json['id'];
    neededStaffCount = json['neededStaffCount'];
    remindStaffCount = json['remindStaffCount'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    roleId = json['roleId'];
    shiftName = json['shiftName'];
    usedStaffCount = json['usedStaffCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cycleId'] = cycleId;
    data['datetime'] = datetime;
    data['id'] = id;
    data['neededStaffCount'] = neededStaffCount;
    data['remindStaffCount'] = remindStaffCount;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['roleId'] = roleId;
    data['shiftName'] = shiftName;
    data['usedStaffCount'] = usedStaffCount;
    return data;
  }
}