import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/transportation.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/shift_status.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/shift_type.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/staff_type.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';
import 'package:latlong2/latlong.dart';

class MockTransportationList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<TransportationModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        6,
        (index) => TransportationModel(
            avatar: faker.image.image(keywords: ['person','avatar','official'],random: true,),
            startAddress: faker.address.streetAddress(),
            endAddress: faker.address.streetAddress(),
            shiftStatus: faker.randomGenerator.element([
              ShiftStatus.inProgress,
              ShiftStatus.done,
              ShiftStatus.pending,
              ShiftStatus.cancel
            ]),
            coordinate: faker.randomGenerator.element([
              const LatLng(60.16987591100654, 24.938313316499567),
              const LatLng(60.1697801212219, 24.938954160388974),
              const LatLng(60.169601488174536, 24.93796452060441),
              const LatLng(60.17008961106294, 24.93820253523614),
              const LatLng(60.170262010179854, 24.93854494225021),
            ]),
            count: faker.randomGenerator.integer(4, min: 1),
            staffType: faker.randomGenerator.element([
              StaffType.practicalNurse,
              StaffType.nurse,
              StaffType.janitor,
              StaffType.onCall,
              StaffType.supervisor,
              StaffType.doctor,
            ]),
            distance: faker.randomGenerator.decimal(scale: 50, min: 10),
            shiftType: faker.randomGenerator.element([
              ShiftType.morning,
              ShiftType.evening,
              ShiftType.night
            ])));
  }
}
