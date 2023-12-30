
import 'package:dio/dio.dart';
import 'package:team_project/features/feature_staff/data/model/staff_response.dart';

abstract class StaffState{}

class StaffInitial extends StaffState{}

class StaffLoading extends StaffState{}

class StaffLoaded extends StaffState{
  final StaffResponse staffResponse;

  StaffLoaded(this.staffResponse);
}

class StaffError extends StaffState{
  DioException error;

  StaffError(this.error);
}