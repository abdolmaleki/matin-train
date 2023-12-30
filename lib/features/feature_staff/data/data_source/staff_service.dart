

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/features/feature_staff/data/model/staff_response.dart';

import '../../../../core/utils/architecture/data/response/api_response.dart';
part 'staff_service.g.dart';
@RestApi(baseUrl: baseUrl)
abstract class StaffService {
 factory StaffService(Dio dio,{String baseUrl})=_StaffService;
 @GET('staffs')
  Future<ApiResponse<StaffResponse>>getStaff();
}