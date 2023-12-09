import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_root/data/root_reposiotry.dart';

class GetAppLanguage implements UseCase<String, NoParams> {
  final RootRepository repository;

  GetAppLanguage(this.repository);

  @override
  Future<String> call(NoParams param) async {
    return await repository.getAppLanguage();
  }
}
