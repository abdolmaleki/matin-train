import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/user.dart';
import 'package:hoivalani/core/utils/remote/dio_client.dart';
import 'package:hoivalani/features/feature_auth/data/data_source/auth_service.dart';
import 'package:hoivalani/features/feature_auth/data/repository/repository.dart';
import 'package:hoivalani/features/feature_equipment/data/data_source/equipment_service.dart';
import 'package:hoivalani/features/feature_equipment/data/repository/repository.dart';
import 'package:hoivalani/features/feature_language_skill/data/data_source/language_skill_service.dart';
import 'package:hoivalani/features/feature_language_skill/data/repository/repository.dart';
import 'package:hoivalani/features/feature_limitation/data/data_source/limitation_service.dart';
import 'package:hoivalani/features/feature_limitation/data/repository/repository.dart';
import 'package:hoivalani/features/feature_splash/data/data_source/splash_service.dart';
import 'package:hoivalani/features/feature_splash/data/repository/repository.dart';
import 'package:hoivalani/features/feature_todo/presentation/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  //todo remove fake data
  getIt.registerSingleton<UserModel>(UserModel());

  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  getIt.registerFactory(() => TodoBloc());
  getIt.registerSingleton(Faker());

  getIt.registerLazySingleton(() => DioClient.getClient());
  getIt.registerLazySingleton(() => LimitationService(getIt.get<Dio>()));
  getIt.registerLazySingleton(() => AuthService(getIt.get<Dio>()));
  getIt.registerLazySingleton(() => SplashService(getIt.get<Dio>()));
  getIt.registerLazySingleton(() => EquipmentService(getIt.get<Dio>()));
  getIt.registerLazySingleton(() => LanguageSkillService(getIt.get<Dio>()));
  getIt.registerLazySingleton(() => LimitationRepository());
  getIt.registerLazySingleton(() => AuthRepository());
  getIt.registerLazySingleton(() => SplashRepository());
  getIt.registerLazySingleton(() => EquipmentRepository());
  getIt.registerLazySingleton(() => LanguageSkillRepository());

  return;
}
