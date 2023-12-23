import 'package:dio/dio.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';

import 'package:team_project/features/feature_medicine/data/data_source/medicine_service.dart';
import 'package:team_project/features/feature_medicine/data/models/medicine_model.dart';




class MedicineRepository {
  final MedicineService medicineSource =
      getIt.get<MedicineService>();

  Future<DataState<MedicineRequest>>getMedicine()async{
    try{
      final result = await medicineSource.getMedicine();
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
}
