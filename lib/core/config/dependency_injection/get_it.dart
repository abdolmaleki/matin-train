import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_project/core/utils/architecture/data/common_models/user.dart';
import 'package:team_project/core/utils/remote/dio_client.dart';
import 'package:team_project/features/fearure_customer/data/data_source/customer_service.dart';
import 'package:team_project/features/fearure_customer/data/repository/customer_repository.dart';
import 'package:team_project/features/feature_auth/data/data_source/auth_service.dart';
import 'package:team_project/features/feature_auth/data/repository/repository.dart';
import 'package:team_project/features/feature_splash/data/data_source/splash_service.dart';
import 'package:team_project/features/feature_splash/data/repository/repository.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  //todo remove fake data
  getIt.registerSingleton<UserModel>(UserModel());

  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  getIt.registerSingleton(Faker());

  getIt.registerLazySingleton(() => DioClient.getClient());
  getIt.registerLazySingleton(() => SplashService(getIt.get<Dio>()));
  getIt.registerLazySingleton(() => SplashRepository());
  getIt.registerLazySingleton(() => AuthService(getIt.get<Dio>()));
  getIt.registerLazySingleton(() => CustomerService(getIt.get<Dio>()));
  getIt.registerLazySingleton(() => AuthRepository());
  getIt.registerLazySingleton(() => CustomerRepository());



  return;
}
