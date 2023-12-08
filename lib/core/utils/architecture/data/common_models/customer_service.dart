import 'package:flutter/material.dart';

class CustomerServiceModel{
  String? visitType;
  String? reportType;
  String? service;
  String? nurseWish;
  TimeOfDay? time;
  String? repeat;
  String? grade;
  String? serviceLength;
  TimeOfDay? startTimeRange;
  TimeOfDay? endTimeRange;
  String? description;

  CustomerServiceModel({
      this.visitType,
      this.reportType,
      this.service,
      this.nurseWish,
      this.time,
      this.repeat,
      this.grade,
      this.serviceLength,
      this.startTimeRange,
      this.endTimeRange,
      this.description});
}