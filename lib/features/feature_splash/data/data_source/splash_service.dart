// flutter pub run build_runner build
import 'package:dio/dio.dart';
import 'package:team_project/core/utils/architecture/data/response/api_response.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/features/feature_splash/data/models/get_user_info_response.dart';
import 'package:retrofit/retrofit.dart';

part 'splash_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class SplashService {
  factory SplashService(Dio dio, {String baseUrl}) = _SplashService;

  @GET("oauth2/userinfo")
  Future<ApiResponse<GetUserInfoResponse>> getUserInfo();

}
