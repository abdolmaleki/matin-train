import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_medicine/data/models/medicine_model.dart';
import 'package:team_project/features/feature_medicine/data/repository/medicine_repository.dart';

class MedicineUseCase implements UseCase<DataState<MedicineModel>,NoParams>{
  final MedicineRepository medicineRepository=getIt.get<MedicineRepository>();
  @override
  Future<DataState<MedicineModel>> call(NoParams param)async {
    return await medicineRepository.getMedicine();
  }
}