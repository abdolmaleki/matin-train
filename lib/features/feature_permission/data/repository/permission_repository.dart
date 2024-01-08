import 'package:dio/dio.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/features/feature_permission/data/data_source/permission_service.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/get_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/update_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/update_permission_response.dart';

import '../../../../core/utils/architecture/data/data_state.dart';

class PermissionRepository{
  final PermissionService _permissionService=getIt.get<PermissionService>();

  Future<DataState<CreatePermissionResponse>>createPermission(CreatePermissionRequest request) async {
    try{
      final result = await _permissionService.createPermission(request);
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
  Future<DataState<GetPermissionResponse>>getPermission()async{
    try{
      final result = await _permissionService.getPermission();
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
  Future<DataState<DeletePermissionResponse>>deletePermission(DeletePermissionRequest request) async {
    try{
      final result = await _permissionService.deletePermission(request);
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
  Future<DataState<UpdatePermissionResponse>>updatePermission(UpdatePermissionRequest request,int id)async{
    try{
      final result = await _permissionService.updatePermission(request,id);
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
}