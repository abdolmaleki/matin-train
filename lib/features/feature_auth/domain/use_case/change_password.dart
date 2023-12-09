import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_auth/data/models/change_password_request.dart';
import 'package:team_project/features/feature_auth/data/models/change_password_response.dart';
import 'package:team_project/features/feature_auth/data/repository/repository.dart';

class ChangePasswordUseCase implements UseCase<DataState<ChangePasswordResponse>, ChangePasswordRequest> {
  final AuthRepository loginRepository=getIt.get<AuthRepository>();


  @override
  Future<DataState<ChangePasswordResponse>> call(ChangePasswordRequest request) async {
    return await loginRepository.changePassword(request);
  }
}