import 'package:team_project/features/feature_root/data/data_source.dart';
import 'package:team_project/features/feature_root/domain/repository/root_repository_impl.dart';
import 'package:team_project/features/feature_root/domain/usecase/get_app_language.dart';
import 'package:team_project/features/feature_root/domain/usecase/save_app_language.dart';

class ApplicationUseCases {
  final GetAppLanguage getAppLanguage =
      GetAppLanguage(RootRepositoryImpl(RootDatasource()));
  final SaveAppLanguage saveAppLanguage =
      SaveAppLanguage(RootRepositoryImpl(RootDatasource()));
}
