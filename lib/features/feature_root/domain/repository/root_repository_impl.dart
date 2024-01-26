import 'package:team_project/features/feature_root/data/data_source.dart';
import 'package:team_project/features/feature_root/data/root_reposiotry.dart';

class RootRepositoryImpl extends RootRepository {
  RootDatasource datasource;

  RootRepositoryImpl(this.datasource);

  @override
  Future<String> getAppLanguage() async {
    return await datasource.getAppLanguage();
  }

  @override
  Future<void> saveAppLanguages(String lang) async {
    await datasource.saveAppLanguage(lang);
    return;
  }
}
