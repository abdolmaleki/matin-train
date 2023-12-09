import 'package:dio/dio.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/data/response/base_response.dart';
import 'package:team_project/features/feature_auth/data/data_source/auth_service.dart';
import 'package:team_project/features/feature_auth/data/models/auth_request.dart';
import 'package:team_project/features/feature_auth/data/models/auth_response.dart';
import 'package:team_project/features/feature_auth/data/models/change_password_request.dart';
import 'package:team_project/features/feature_auth/data/models/change_password_response.dart';
import 'package:team_project/features/feature_auth/data/models/otp_setting_response.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_request.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_response.dart';
import 'package:team_project/features/feature_auth/data/models/verify_otp_request.dart';
import 'package:team_project/features/feature_auth/data/models/verify_otp_response.dart';

class AuthRepository {


  final AuthService _loginService=getIt.get<AuthService>();

  Future<DataState<OtpSettingResponse>> getOtpSetting()async {
   try{
     final result=await _loginService.getOtpSetting();
       return DataSuccess(result.data!);
   }on DioException catch (e){
     return DataError(e);
   }
  }

  Future<DataState<SendOtpResponse>> sendOtp(SendOtpRequest request)async {
    try{
      final result=await _loginService.sendOtp(request);
      return DataSuccess(result.data!);
    }on DioException catch (e){
      return DataError(e);
    }
  }

  Future<DataState<VerifyOtpResponse>> verifyOtp(VerifyOtpRequest request)async {
    try{
      final result=await _loginService.verifyOtp(request);
      return DataSuccess(result.data!);
    }on DioException catch (e){
      return DataError(e);
    }
  }

  Future<DataState<AuthResponse>> auth(AuthRequest request)async {
    try{
      final result=await _loginService.auth(request);
      return DataSuccess(result.data!);
    }on DioException catch (e){
      return DataError(e);
    }
  }

  Future<DataState<BaseResponse>> acceptPolicy()async {
    try{
      final result=await _loginService.policy();
      return DataSuccess(result.data!);
    }on DioException catch (e){
      return DataError(e);
    }
  }

  Future<DataState<ChangePasswordResponse>> changePassword(ChangePasswordRequest request)async {
    try{
      final result=await _loginService.changePassword(request);
      return DataSuccess(result.data!);
    }on DioException catch (e){
      return DataError(e);
    }
  }


}
