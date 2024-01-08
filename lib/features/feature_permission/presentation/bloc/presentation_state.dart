import 'package:dio/dio.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/get_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/update_permission_response.dart';

abstract class PermissionState {}

class PermissionInitial extends PermissionState {}

class PermissionLoading extends PermissionState {}

class PermissionLoaded extends PermissionState {
  final GetPermissionResponse getPermissionResponse;

  PermissionLoaded(this.getPermissionResponse);
}

class PermissionAdded extends PermissionState {
  final CreatePermissionResponse createPermissionResponse;

  PermissionAdded(this.createPermissionResponse);
}

class PermissionDeleted extends PermissionState {
  final DeletePermissionResponse deletePermissionResponse;

  PermissionDeleted(this.deletePermissionResponse);
}

class PermissionUpdated extends PermissionState {
  final UpdatePermissionResponse updatePermissionResponse;

  PermissionUpdated(this.updatePermissionResponse);
}
class PermissionError extends PermissionState{
  DioException error;

  PermissionError(this.error);
}
