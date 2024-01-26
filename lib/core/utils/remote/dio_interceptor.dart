import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/constants/keys/sharead_preference.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(_buildDioHeader());
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  Map<String, String> _buildDioHeader() {
    final Map<String, String> headers = {};
    headers.addAll({'accept': 'application/json'});
    // If user has been authorized, token will be added to header
    if (_isAuthorized()) {
      headers.addAll({'Authorization': 'Bearer ${_fetchToken()}'});
    }
    return headers;
  }

  bool _isAuthorized() {
    SharedPreferences sharedPreferences = getIt.get<SharedPreferences>();
    return sharedPreferences.containsKey(SharedPreferenceKey.token);
  }

  String _fetchToken() {
    SharedPreferences sharedPreferences = getIt.get<SharedPreferences>();
    return sharedPreferences.getString(SharedPreferenceKey.token)!;
  }
}
