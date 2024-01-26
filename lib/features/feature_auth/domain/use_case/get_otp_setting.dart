import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_auth/data/models/otp_setting_response.dart';
import 'package:team_project/features/feature_auth/data/repository/repository.dart';

class GetOtpSettingUseCase implements UseCase<DataState<OtpSettingResponse>, NoParams> {
  final AuthRepository loginRepository=getIt.get<AuthRepository>();


  @override
  Future<DataState<OtpSettingResponse>> call(NoParams param) async {
    return await loginRepository.getOtpSetting();
  }
}