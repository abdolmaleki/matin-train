import 'package:team_project/features/feature_permission/data/model/update_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/update_permission_response.dart';

import '../../../../core/config/dependency_injection/get_it.dart';
import '../../../../core/utils/architecture/data/data_state.dart';
import '../../data/repository/permission_repository.dart';

class UpdatePermissionUseCase{
  final PermissionRepository _permissionRepository = getIt.get<PermissionRepository>();
  Future<DataState<UpdatePermissionResponse>>updatePermission(UpdatePermissionRequest request,int id) async {
    return await _permissionRepository.updatePermission(request, id);
  }
}