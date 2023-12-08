import 'dart:io';

class AbsenceModel {


  DateTime? startDate;
  DateTime? endDate;
  String? reason;
  String? attachmentPath;
  List<File> attachments = [];
  bool? unlimited;

  AbsenceModel({this.startDate, this.endDate, this.reason});

}
