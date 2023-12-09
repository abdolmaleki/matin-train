import 'package:team_project/core/utils/architecture/data/common_models/staff.dart';
import 'package:team_project/core/utils/architecture/domain/common_enums/shift_type.dart';
import 'package:team_project/core/utils/architecture/domain/common_enums/staff_type.dart';

class KeikkalaShiftModel {
  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? endTime;
  StaffModel? staff;
  StaffType? staffType;
  String? section;
  String? team;
  PaymentType? paymentType;
  String? description;
  bool? isFreelancing;
  ShiftType? shiftType;
  int? bonus;

  KeikkalaShiftModel(
      {this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.staffType,
      this.section,
      this.team,
      this.paymentType,
      this.description,
      this.staff,
      this.bonus,
      this.shiftType,
      this.isFreelancing});
}

enum PaymentType {
  paySoon,
  bonus,
  nothing,
}
