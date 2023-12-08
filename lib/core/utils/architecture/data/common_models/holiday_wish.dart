import 'package:hoivalani/core/utils/architecture/data/common_models/holiday.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/staff.dart';

class HolidayWishModel {
  int id;
  StaffModel? staff;
  HolidayModel? holiday;
  String? requestStatus;

  HolidayWishModel(
      {required this.id, this.staff, this.holiday, this.requestStatus});
}
