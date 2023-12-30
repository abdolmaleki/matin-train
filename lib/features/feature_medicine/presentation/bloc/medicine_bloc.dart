
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_medicine/data/models/create_medicine_request.dart';
import 'package:team_project/features/feature_medicine/domain/usecases/create_medicine_usecase.dart';
import 'package:team_project/features/feature_medicine/domain/usecases/get_medicine_usecase.dart';
import 'package:team_project/features/feature_medicine/presentation/bloc/medicine_state.dart';

class MedicineBloc extends Cubit<MedicineState>{
  final GetMedicinesUseCase medicineUseCase = GetMedicinesUseCase();
  final CreateMedicineUseCase createMedicineUseCase = CreateMedicineUseCase();
  MedicineBloc():super(MedicineInitial());

  void medicineLoaded()async{
    emit(MedicineLoading());
    final result = await medicineUseCase(NoParams());
    if(result is DataSuccess){
      emit(MedicineLoaded(result.data!));
    }else{
      emit(MedicineError(result.error!));
    }
  }
  void medicineAdded(CreateMedicineRequest request)async{
    final result = await createMedicineUseCase(request);
    if(result is DataSuccess){
      emit(MedicineAdded(result.data!));
    }else{
      emit(MedicineError(result.error!));
    }
  }
}