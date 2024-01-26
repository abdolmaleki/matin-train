import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_request.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_response.dart';
import 'package:team_project/features/feature_auth/data/repository/repository.dart';

class SendOtpUseCase implements UseCase<DataState<SendOtpResponse>, SendOtpRequest> {
  final AuthRepository loginRepository=getIt.get<AuthRepository>();



  @override
  Future<DataState<SendOtpResponse>> call(SendOtpRequest request) async {
    return await loginRepository.sendOtp(request);
  }
}