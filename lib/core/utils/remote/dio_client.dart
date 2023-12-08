import 'package:dio/dio.dart';
import 'package:hoivalani/core/utils/remote/dio_interceptor.dart';

class DioClient {
  static Dio getClient() {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    return dio;
  }
}
