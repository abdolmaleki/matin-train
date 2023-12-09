import 'package:dio/dio.dart';
import 'package:team_project/core/utils/remote/dio_interceptor.dart';

class DioClient {
  static Dio getClient() {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    return dio;
  }
}
