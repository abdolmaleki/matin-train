import 'package:dio/dio.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/features/feature_splash/data/data_source/splash_service.dart';
import 'package:team_project/features/feature_splash/data/models/get_user_info_response.dart';

class SplashRepository {

  final SplashService _splashService=getIt.get<SplashService>();

  Future<DataState<GetUserInfoResponse>> getUserInfo()async {
   try{
     final result=await _splashService.getUserInfo();
       return DataSuccess(result.data!);
   }on DioException catch (e){
     return DataError(e);
   }
  }

}
