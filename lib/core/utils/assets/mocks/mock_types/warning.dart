import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/punishment.dart';
import 'package:team_project/core/utils/architecture/data/common_models/warning.dart';
import 'package:team_project/core/utils/assets/mocks/enum.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockWarningList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<WarningModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        4,
        (index) => WarningModel(
            description: faker.lorem.sentence(),
            warningCount: faker.randomGenerator.integer(4, min: 1),
            punishment: (MockData(MockType.punishmentList).getMockObject()
                as List<PunishmentModel>)[faker.randomGenerator.integer(3, min: 0)],
            name: faker.lorem.word()));
  }
}
