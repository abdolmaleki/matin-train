// flutter pub run build_runner build
import 'package:dio/dio.dart';
import 'package:team_project/core/utils/architecture/data/response/api_response.dart';
import 'package:team_project/core/utils/architecture/data/response/base_response.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/features/feature_auth/data/models/auth_request.dart';
import 'package:team_project/features/feature_auth/data/models/auth_response.dart';
import 'package:team_project/features/feature_auth/data/models/change_password_request.dart';
import 'package:team_project/features/feature_auth/data/models/change_password_response.dart';
import 'package:team_project/features/feature_auth/data/models/otp_setting_response.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_request.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_response.dart';
import 'package:team_project/features/feature_auth/data/models/verify_otp_request.dart';
import 'package:team_project/features/feature_auth/data/models/verify_otp_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @GET("otp/settings")
  Future<ApiResponse<OtpSettingResponse>> getOtpSetting();

  @POST("otp/send")
  Future<ApiResponse<SendOtpResponse>> sendOtp(@Body() SendOtpRequest request);

  @POST("otp/verify")
  Future<ApiResponse<VerifyOtpResponse>> verifyOtp(
      @Body() VerifyOtpRequest request);

  @POST("oauth2/auth")
  Future<ApiResponse<AuthResponse>> auth(@Body() AuthRequest request);

  @PUT("users/change-password")
  Future<ApiResponse<ChangePasswordResponse>> changePassword(
      @Body() ChangePasswordRequest request);

  @PUT("users/accept-policy")
  Future<ApiResponse<BaseResponse>> policy();
}
