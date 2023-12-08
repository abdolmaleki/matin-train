import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/grace.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/reward.dart';
import 'package:hoivalani/core/utils/assets/mocks/enum.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockGraceList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<GraceModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        4,
        (index) => GraceModel(
            description: faker.lorem.sentence(),
            graceCount: faker.randomGenerator.integer(4, min: 1),
            reward: (MockData(MockType.rewardList).getMockObject()
                as List<RewardModel>)[faker.randomGenerator.integer(3, min: 0)],
            name: faker.lorem.word()));
  }
}
