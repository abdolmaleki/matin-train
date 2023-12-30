import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_staff/domain/usecases/staff_usecase.dart';
import 'package:team_project/features/feature_staff/presentation/bloc/staff_state.dart';

class StaffBloc extends Cubit<StaffState>{
  final StaffUseCase staffUseCase = StaffUseCase();
  StaffBloc():super(StaffInitial());
  void loadStaff()async{
    emit(StaffLoading());
    final result = await staffUseCase(NoParams());
    if(result is DataSuccess){
      emit(StaffLoaded(result.data!));
    }else{
      emit(StaffError(result.error!));
    }
  }
}