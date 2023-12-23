

import 'package:team_project/features/feature_medicine/data/models/medicine_response.dart';

abstract class MedicineState {}

class MedicineInitial extends MedicineState {}

class MedicineLoading extends MedicineState {}

class MedicineLoaded extends MedicineState {
 final MedicineResponse medicineModel;

 MedicineLoaded(this.medicineModel);
}
class MedicineError extends MedicineState{
 final Exception exception;

 MedicineError(this.exception);
}
