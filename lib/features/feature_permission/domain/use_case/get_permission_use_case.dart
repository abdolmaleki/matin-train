import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_permission/data/model/get_permission_response.dart';

import '../../../../core/config/dependency_injection/get_it.dart';
import '../../data/repository/permission_repository.dart';

class GetPermissionUseCase implements UseCase<DataState<GetPermissionResponse>,NoParams>{
  final PermissionRepository _permissionRepository = getIt.get<PermissionRepository>();

  @override
  Future<DataState<GetPermissionResponse>> call(NoParams param)async {
    return await _permissionRepository.getPermission();
  }


}