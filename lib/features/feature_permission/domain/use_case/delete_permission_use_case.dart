import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_response.dart';

import '../../../../core/config/dependency_injection/get_it.dart';
import '../../data/repository/permission_repository.dart';

class DeletePermissionUseCase implements UseCase<DataState<DeletePermissionResponse>,DeletePermissionRequest>{
  final PermissionRepository _permissionRepository = getIt.get<PermissionRepository>();

  @override
  Future<DataState<DeletePermissionResponse>> call(DeletePermissionRequest request) async {
    return await _permissionRepository.deletePermission(request);
  }

}