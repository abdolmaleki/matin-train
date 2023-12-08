import 'package:hoivalani/core/utils/architecture/data/common_models/attachment.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/staff.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/staff_type.dart';

class EventModel {
  String? name;
  String? location;
  EventTypeModel? eventType;
  int? participantCount;
  String? description;
  bool? unlimitedParticipant;
  List<StaffType>? staffTypes;
  List<StaffModel>? staffs;
  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? endTime;
  List<AttachmentModel>? attachments;

  EventModel(
      {this.name,
      this.eventType,
      this.participantCount,
      this.description,
      this.unlimitedParticipant,
      this.staffTypes,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.location,
      this.staffs,
      this.attachments});
}

class EventTypeModel {
  int? id;
  String? name;

  EventTypeModel({this.id, this.name});
}
