import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/update_permission_request.dart';
import 'package:team_project/features/feature_permission/domain/use_case/create_permission_use_case.dart';
import 'package:team_project/features/feature_permission/domain/use_case/delete_permission_use_case.dart';
import 'package:team_project/features/feature_permission/domain/use_case/get_permission_use_case.dart';
import 'package:team_project/features/feature_permission/domain/use_case/update_permission_use_case.dart';
import 'package:team_project/features/feature_permission/presentation/bloc/presentation_state.dart';

class PermissionBloc extends Cubit<PermissionState>{
  final GetPermissionUseCase _getPermissionUseCase = GetPermissionUseCase();
  final CreatePermissionUseCase _createPermissionUseCase = CreatePermissionUseCase();
  final DeletePermissionUseCase _deletePermissionUseCase = DeletePermissionUseCase();
  final UpdatePermissionUseCase _updatePermissionUseCase = UpdatePermissionUseCase();
  PermissionBloc():super(PermissionInitial());

  void loadPermission()async{
    emit(PermissionLoading());
    final result =await _getPermissionUseCase(NoParams());
    if(result is DataSuccess){
      emit(PermissionLoaded(result.data!));
    }else{
      emit(PermissionError(result.error!));
    }
  }
  void addPermission(CreatePermissionRequest request)async{
    final result =await _createPermissionUseCase(request);
    if(result is DataSuccess){
      emit(PermissionAdded(result.data!));
    }else{
      emit(PermissionError(result.error!));
    }
  }
  void deletePermission(DeletePermissionRequest request)async{
    final result =await _deletePermissionUseCase(request);
    if(result is DataSuccess){
      emit(PermissionDeleted(result.data!));
    }else{
      emit(PermissionError(result.error!));
    }
  }
  void updatePermission(UpdatePermissionRequest request ,int id)async{
    final result =await _updatePermissionUseCase.updatePermission(request, id);
    if(result is DataSuccess){
      emit(PermissionUpdated(result.data!));
    }else{
      emit(PermissionError(result.error!));
    }
  }
}