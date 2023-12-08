import 'package:hoivalani/core/utils/architecture/domain/common_enums/shift_status.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/shift_type.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/staff_type.dart';
import 'package:latlong2/latlong.dart';

class TransportationModel {
  final String startAddress;
  final String endAddress;
  final double distance;
  final LatLng coordinate;
  final String avatar;
  final ShiftType shiftType;
  final ShiftStatus shiftStatus;
  final StaffType staffType;
  final int count;

  TransportationModel(
      {required this.startAddress,
      required this.count,
      required this.staffType,
      required this.endAddress,
      required this.distance,
      required this.coordinate,
      required this.avatar,
      required this.shiftType,
      required this.shiftStatus});
}
