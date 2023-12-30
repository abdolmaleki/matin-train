import 'package:dio/dio.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/features/feature_staff/data/data_source/staff_service.dart';
import 'package:team_project/features/feature_staff/data/model/staff_response.dart';

import '../../../../core/utils/architecture/data/data_state.dart';

class StaffRepository {
  final StaffService staffService = getIt.get<StaffService>();
  Future<DataState<StaffResponse>>getStaff()async{
    try{
      final result = await staffService.getStaff();
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
}