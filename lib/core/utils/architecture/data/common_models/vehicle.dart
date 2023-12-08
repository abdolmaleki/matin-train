class VehicleModel {
  String? _brand;
  String? _model;
  String? _year;
  String? _gearType;
  String? _fuelType;
  String? _vehicleNo;

  set brand(String value) {
    _brand = value;
  }

  set model(String value) {
    _model = value;
  }

  set vehicleNo(String value) {
    _vehicleNo = value;
  }

  set fuelType(String value) {
    _fuelType = value;
  }

  set gearType(String value) {
    _gearType = value;
  }

  set year(String value) {
    _year = value;
  }

  String get vehicleNo => _vehicleNo ?? "";

  String get fuelType => _fuelType ?? "";

  String get gearType => _gearType ?? "";

  String get year => _year ?? "";

  String get model => _model ?? "";

  String get brand => _brand ?? "";
}
