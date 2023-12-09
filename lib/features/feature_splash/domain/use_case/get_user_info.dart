import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_splash/data/models/get_user_info_response.dart';
import 'package:team_project/features/feature_splash/data/repository/repository.dart';

class GetUserInfoUseCase
    implements UseCase<DataState<GetUserInfoResponse>, NoParams> {
  final SplashRepository splashRepository = getIt.get<SplashRepository>();

  @override
  Future<DataState<GetUserInfoResponse>> call(NoParams param) async {
    return await splashRepository.getUserInfo();
  }
}
