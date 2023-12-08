import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/events.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockEventTypeList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<EventTypeModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        4,
        (index) => EventTypeModel(
            id: faker.randomGenerator.integer(100,min: 1),
            name: faker.lorem.word()));
  }
}
