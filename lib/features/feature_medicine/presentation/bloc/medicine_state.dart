

import 'package:team_project/features/feature_medicine/data/models/create_medicine_response.dart';
import 'package:team_project/features/feature_medicine/data/models/get_medicine_response.dart';

abstract class MedicineState {}

class MedicineInitial extends MedicineState {}

class MedicineLoading extends MedicineState {}

class MedicineLoaded extends MedicineState {
 final GetMedicineResponse medicineModel;

 MedicineLoaded(this.medicineModel);
}
class MedicineError extends MedicineState{
 final Exception exception;

 MedicineError(this.exception);
}
class MedicineAdded extends MedicineState{
 final CreateMedicineResponse createMedicineResponse;

 MedicineAdded(this.createMedicineResponse);
}
