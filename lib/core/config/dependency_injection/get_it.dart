import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_project/core/utils/architecture/data/common_models/user.dart';
import 'package:team_project/core/utils/remote/dio_client.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  //todo remove fake data
  getIt.registerSingleton<UserModel>(UserModel());

  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  getIt.registerSingleton(Faker());

  getIt.registerLazySingleton(() => DioClient.getClient());


  return;
}
