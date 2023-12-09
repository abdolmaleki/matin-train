import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_auth/data/models/auth_request.dart';
import 'package:team_project/features/feature_auth/data/models/auth_response.dart';
import 'package:team_project/features/feature_auth/data/repository/repository.dart';

class AuthUseCase implements UseCase<DataState<AuthResponse>, AuthRequest> {
  final AuthRepository loginRepository=getIt.get<AuthRepository>();


  @override
  Future<DataState<AuthResponse>> call(AuthRequest request) async {
    return await loginRepository.auth(request);
  }
}