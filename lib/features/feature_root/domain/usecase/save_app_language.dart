import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_root/data/root_reposiotry.dart';

class SaveAppLanguage implements UseCase<void, String> {
  final RootRepository repository;
  SaveAppLanguage(this.repository);

  @override
  Future<void> call(String appLanguage) async {
    return await repository.saveAppLanguages(appLanguage);
  }
}
