import 'package:dio/dio.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';

import 'package:team_project/features/feature_medicine/data/data_source/medicine_service.dart';
import 'package:team_project/features/feature_medicine/data/models/create_medicine_request.dart';
import 'package:team_project/features/feature_medicine/data/models/create_medicine_response.dart';
import 'package:team_project/features/feature_medicine/data/models/get_medicine_response.dart';




class MedicineRepository {
  final MedicineService medicineSource =
      getIt.get<MedicineService>();

  Future<DataState<GetMedicineResponse>>getMedicine()async{
    try{
      final result = await medicineSource.getMedicine();
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
  Future<DataState<CreateMedicineResponse>>createMedicine(CreateMedicineRequest request)async{
    try{
      final result =await medicineSource.createMedicine(request);
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
}
