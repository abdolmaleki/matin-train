import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_medicine/data/models/create_medicine_request.dart';
import 'package:team_project/features/feature_medicine/data/models/create_medicine_response.dart';
import 'package:team_project/features/feature_medicine/data/repository/medicine_repository.dart';

class CreateMedicineUseCase implements UseCase<DataState<CreateMedicineResponse>,CreateMedicineRequest>{
  final MedicineRepository medicineRepository = getIt.get<MedicineRepository>();

  @override
  Future<DataState<CreateMedicineResponse>> call(CreateMedicineRequest request)async {
    return medicineRepository.createMedicine(request);
  }
}