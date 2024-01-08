import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_response.dart';
import 'package:team_project/features/feature_permission/data/repository/permission_repository.dart';

class CreatePermissionUseCase implements UseCase<DataState<CreatePermissionResponse>,CreatePermissionRequest>{
  final PermissionRepository _permissionRepository = getIt.get<PermissionRepository>();

  @override
  Future<DataState<CreatePermissionResponse>> call(CreatePermissionRequest request)async {
    return await _permissionRepository.createPermission(request);
  }
}