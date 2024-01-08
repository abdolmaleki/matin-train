import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/get_permission_response.dart';
import 'package:team_project/features/feature_permission/data/model/update_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/update_permission_response.dart';

import '../../../../core/utils/architecture/data/response/api_response.dart';

part 'permission_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PermissionService {
  factory PermissionService(Dio dio, {String baseUrl}) = _PermissionService;

  @POST('permissions')
  Future<ApiResponse<CreatePermissionResponse>> createPermission(
      @Body() CreatePermissionRequest request);

  @GET('permissions')
  Future<ApiResponse<GetPermissionResponse>> getPermission();

  @DELETE('permissions')
  Future<ApiResponse<DeletePermissionResponse>> deletePermission(
      @Body() DeletePermissionRequest request);

  @PUT('permissions/{id}')
  Future<ApiResponse<UpdatePermissionResponse>> updatePermission(
      @Body() UpdatePermissionRequest request, @Path('id') int id);
}
