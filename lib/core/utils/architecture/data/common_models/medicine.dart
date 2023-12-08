class MedicineModel {
  String? prescription;
  String? name;
  int? doseAmount;
  DateTime? dateTime;
  String? repeat;
  DateTime? startDate;
  DateTime? endDate;
  String? howToUse;
  String? preCondition;
  int? doseUnit;

  MedicineModel(
      {this.prescription,
      this.name,
      this.doseAmount,
      this.dateTime,
      this.repeat,
      this.startDate,
      this.endDate,
      this.howToUse,
      this.doseUnit,
      this.preCondition});
}
