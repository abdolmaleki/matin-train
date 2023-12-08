import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/attention.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/punishment.dart';
import 'package:hoivalani/core/utils/assets/mocks/enum.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockAttentionList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<AttentionModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        4,
        (index) => AttentionModel(
            description: faker.lorem.sentence(),
            attentionCount: faker.randomGenerator.integer(4, min: 1),
            punishment: (MockData(MockType.punishmentList).getMockObject()
                as List<PunishmentModel>)[faker.randomGenerator.integer(3, min: 0)],
            name: faker.lorem.word()));
  }
}
