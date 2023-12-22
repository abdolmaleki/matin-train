import 'package:dio/dio.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';

import 'package:team_project/features/feature_medicine/data/data_source/medicine_source.dart';
import 'package:team_project/features/feature_medicine/data/models/medicine_model.dart';




class MedicineRepository {
  final MedicineSource medicineSource =
      MedicineSource(Dio(BaseOptions(contentType: 'application/json')));

  Future<DataState<MedicineModel>>getMedicine()async{
    try{
      final result = await medicineSource.getMedicine();
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
}
