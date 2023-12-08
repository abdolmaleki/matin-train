import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/absence.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockAbsenceList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<AbsenceModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        3,
        (index) => AbsenceModel(
            endDate: faker.date.dateTime(minYear: 2023,maxYear: 2023),
            startDate: faker.date.dateTime(minYear: 2022,maxYear: 2022),
            reason: faker.lorem.sentence()));
  }
}
