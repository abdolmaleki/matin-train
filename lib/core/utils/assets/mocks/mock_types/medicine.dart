import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/medicine.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockMedicineList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<MedicineModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        3,
        (index) => MedicineModel(
            name: faker.lorem.word(),
            dateTime: faker.date.dateTime(),
            doseAmount: faker.randomGenerator.integer(200, min: 50),
            doseUnit: faker.randomGenerator.integer(4, min: 1),
            endDate: faker.date.dateTime(minYear: 2023,maxYear: 2024),
            startDate: faker.date.dateTime(minYear: 2023,maxYear: 2024),
            howToUse: faker.lorem.sentences(4).toString(),
            preCondition: faker.lorem.sentences(4).toString(),
            prescription: faker.lorem.word(),
            repeat: "Daily"));
  }
}
